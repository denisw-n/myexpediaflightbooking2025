$(document).ready(function(){
    const countrymodal = $("#countrydetailsmodal"),
        addnewcountrybutton = $("#addnewcountry"),
        countryidfield = $("#countryid"),
        countrynamefield = $("#countryname"),
        savecountrybutton = $("#savecountry"),
        notifications = $("#notifications"),
        countiestable = $("#countriestable"),
        countrynotifications = $("#countrynotifications");

    // Load all countries
    getcountriesastable();

    // Open modal for new country
    addnewcountrybutton.on("click", function(){
        countryidfield.val("0");
        countrynamefield.val("");
        notifications.html("");
        countrymodal.modal("show");
    });

    // Save (create or update)
    savecountrybutton.on("click", function(){
        const id = countryidfield.val(),
              name = countrynamefield.val();

        if(name === ""){
            notifications.html("<div class='alert alert-primary'>Please enter country name</div>");
            countrynamefield.focus();
            return;
        }

        let postData = {};
        if(id === "0"){ 
            // Create
            postData = { createCountry: true, countryname: name };
        } else {
            // Update
            postData = { updateCountry: true, countryid: id, countryname: name };
        }

        $.post("controllers/countryoperations.php", postData, function(data){
            if(isJSON(data)){
                data = JSON.parse(data);
                if(data.status === "success"){
                    notifications.html("<div class='alert alert-success'>"+data.message+"</div>");
                    getcountriesastable();
                    countrymodal.modal("hide");
                }else{
                    notifications.html("<div class='alert alert-danger'>"+data.message+"</div>");
                }
            }else{
                notifications.html("<div class='alert alert-danger'>Unexpected response: "+data+"</div>");
            }
        });
    });

    // Edit handler
    $(document).on("click", ".editCountry", function(e){
        e.preventDefault();
        countryidfield.val($(this).data("id"));
        countrynamefield.val($(this).data("name"));
        notifications.html("");
        countrymodal.modal("show");
    });

    // Delete handler
    $(document).on("click", ".deleteCountry", function(e){
        e.preventDefault();
        if(!confirm("Are you sure you want to delete this country?")) return;

        const id = $(this).data("id");

        $.post("controllers/countryoperations.php",
            { deleteCountry: true, countryid: id },
            function(data){
                if(isJSON(data)){
                    data = JSON.parse(data);
                    if(data.status === "success"){
                        countrynotifications.html("<div class='alert alert-success'>"+data.message+"</div>");
                        getcountriesastable();
                    }else{
                        countrynotifications.html("<div class='alert alert-danger'>"+data.message+"</div>");
                    }
                }else{
                    countrynotifications.html("<div class='alert alert-danger'>Unexpected response: "+data+"</div>");
                }
            }
        );
    });

    // Utility
    function isJSON(str){
        try { JSON.parse(str); return true; }
        catch(e){ return false; }
    }

    // Load table
    function getcountriesastable(){
        $.getJSON("controllers/countryoperations.php", { getAllCountries: true })
        .done(function(data){
            let results = "";
            data.forEach(function(country,i){
                results += `
                  <tr>
                    <td>${i+1}</td>
                    <td>${country.CountryName}</td>
                    <td>${country.cities}</td>
                    <td>${country.airports}</td>
                    <td>${country.airlines}</td>
                    <td>
                      <a href="#" class="editCountry text-primary" 
                         data-id="${country.CountryId}" data-name="${country.CountryName}">
                         <i class="fas fa-edit"></i></a>
                      <a href="#" class="deleteCountry text-danger ml-2" 
                         data-id="${country.CountryId}">
                         <i class="fas fa-trash"></i></a>
                    </td>
                  </tr>`;
            });
            countiestable.find("tbody").html(results);
        })
        .fail(function(response){
            countrynotifications.html(`<div class='alert alert-danger'>${response.responseText}</div>`);
        });
    }
});

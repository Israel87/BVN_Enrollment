
//  Ajax calls


$(function () {
    console.log("testing...")
    $.ajax({
        type: "POST",
        url: "../EnrolWebService.asmx/Admin_GetEnrolled",
        data: '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            console.log("flip side");
            console.log(result.d)
            var data = JSON.parse(result.d);
            if (result.d != "") {
                var html = "";
                console.log(data)
                if (data.length != 0) {
                    console.log(data)
                    $("#totalenrolled").html(data[0]["TOTALENROLLED"]);
                    
                }
            }
        }
    });


    $.ajax({
        type: "POST",
        url: "../EnrolWebService.asmx/Admin_GetApproved",
        data: '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            //console.log("flip side");
            console.log(result.d)
            var data = JSON.parse(result.d);
            if (result.d != "") {
                var html = "";
                console.log(data)
                if (data.length != 0) {
                    console.log(data)
                    $("#totalapproved").html(data[0]["TOTALAPPROVED"]);

                }
            }
        }
    });


    $.ajax({
        type: "POST",
        url: "../EnrolWebService.asmx/Admin_SoftRejected",
        data: '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            //console.log("flip side");
            console.log(result.d)
            var data = JSON.parse(result.d);
            if (result.d != "") {
                var html = "";
                console.log(data)
                if (data.length != 0) {
                    console.log(data)
                    $("#totalsoftrejected").html(data[0]["TOTALSOFTREJECTED"]);

                }
            }
        }
    });



    $.ajax(
        {
            type: "POST",
            url: "../EnrolWebService.asmx/Admin_Rejected",
            data: '',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: true,
            success: function (result) {
                //console.log("flip side");
                console.log(result.d)
                var data = JSON.parse(result.d);
                if (result.d != "") {
                    var html = "";
                    console.log(data)
                    if (data.length != 0) {
                        console.log(data)
                        $("#totalrejected").html(data[0]["TOTALREJECTED"]);

                    }
                }
            }
        });



    // total untreated
    $.ajax({
        type: "POST",
        url: "../EnrolWebService.asmx/Admin_Untreated",
        data: '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            //console.log("flip side");
            console.log(result.d)
            var data = JSON.parse(result.d);
            if (result.d != "") {
                var html = "";
                console.log(data)
                if (data.length != 0) {
                    console.log(data)
                    $("#totaluntreated").html(data[0]["TOTALUNTREATED"]);

                }
            }
        }
    });

    // list of organization

    //$.ajax({
    //    type: "POST",
    //    url: "../EnrolWebService.asmx/getOrganization",
    //    contentType: "application/json; charset=utf-8",
    //    success: function (data) {
    //        var _data = eval(data.d);
    //        $('#datatable').dataTable({
				//"dom":'lBrtip',
				//"processing": true,
				//"serverSide": true,
				//"buttons":['csv','excel','pdf'],
    //            data: _data,        
    //            columns: [
    //                // { "data": "BIODATAID" },
    //                { "data": "ID" },
    //                { "data": "ORGANIZATIONNAME" },
    //                { "data": "STATUS" },    
    //            ]
    //        });
    //    }
    //});


    //// list of enrolling agents
    //$.ajax({
    //    type: "POST",
    //    url: "../EnrolWebService.asmx/getAgents",
    //    contentType: "application/json; charset=utf-8",
    //    success: function (data) {
    //        var _data = eval(data.d);
    //        $('#agentlist').dataTable({

    //            data: _data,
    //            columns: [
    //                // { "data": "BIODATAID" },
    //                { "data": "AGENTID" },
    //                { "data": "FIRSTNAME" },
    //                { "data": "MIDDLENAME" },
    //                { "data": "LASTNAME" },
    //                { "data": "PHONENUMBER" },
    //                { "data": "EMAIL" },
    //                { "data": "STATUS" },
    //                { "data": "ORGANIZATIONID" },
    //            ]
    //        });
    //    }
    //});


    //// list of enrolling users
    //$.ajax({
    //    type: "POST",
    //    url: "../EnrolWebService.asmx/getEnrollingUsers",
    //    contentType: "application/json; charset=utf-8",
    //    success: function (data) {
    //        var _data = eval(data.d);
    //        $('#users').dataTable({

    //            data: _data,
    //            columns: [
    //                // { "data": "BIODATAID" },
    //                { "data": "UserID" },
    //                { "data": "USERNAME" },
    //                { "data": "EMAIL" },
    //                { "data": "PASSWORD" },
    //                { "data": "FIRSTNAME" },
    //                { "data": "LASTNAME" },
    //                { "data": "STATUS" },
                   
    //            ]
    //        });
    //    }
    //});


    // get the list of enrolled data
    //$.ajax({
    //    type: "POST",
    //    url: "../EnrolWebService.asmx/Admin_GetEnrolledList",
    //    contentType: "application/json; charset=utf-8",
    //    success: function (data) {
    //        console.log(data);
    //        var _data = eval(data.d);
    //        $('#enrolled').dataTable({
    //            data: _data,
    //            columns: [
    //                // calling data from ajax response and attaching to the view.
    //                { "data": "ENROLFORMID" },
    //                { "data": "SURNAME" },
    //                { "data": "FIRSTNAME" },
    //                { "data": "CUSTOMERID" },
    //                { "data": "ANMFINCN" },
    //                { "data": "TITLE" },
    //                { "data": "MARITALSTATUS" },
    //                { "data": "GENDER"},
    //                { "data": "DOB" },
    //                { "data": "LGA" },
    //                { "data": "SOO" },
    //                { "data": "NATIONALITY" },
    //                { "data": "RESIDENTIALADDRESS" },
    //                { "data": "LGARESIDENCE" },
    //                { "data": "STATERESIDENCE" },
    //                { "data": "PHONENUMBER1" },
    //                { "data": "EMAILADDRESS" },
    //                { "data": "TICKETID" },
    //                { "data": "DATECREATED" },
    //                { "data": "FORMSTATUS" },
    //                { "data": "CAPTUREDBY" },
    //                { "data": "SOC" },
    //                { "data": "LOC" },
    //                { "data": "ORGANIZATIONID" },
    //                { "data": "AGENTID" },
    //            ]
    //        });
    //    }
    //});
























})







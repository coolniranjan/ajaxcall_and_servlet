<%-- 
    Document   : index
    Created on : 24-Dec-2022, 9:22:08 pm
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<script src="jquery-3.6.1.min.js"></script>-->
        <title>JSP Page</title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js" type="text/javascript"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
    </head>
    <body>
        <form id="myAjaxRequestForm" method="post" >
            <label for="fname">First name:</label><br>
            <input type="text" id="fname" name="fname" ><br>
            <label for="lname">Last name:</label><br>
            <input type="text" id="lname" name="lname" ><br><br>      
            <input id="myButton" type="button" value="Submit" />
        </form>


        <div class="container">
            <h2>details of user</h2>
            <input id="fetchbtn" type="button" value="Fetch user" />
            

            <div id="setofdata"></div>
        </div>
        <script >

// code for send data to database using ajax

            $("#myButton").click(function (e) {
                dataString = $("#myAjaxRequestForm").serialize();
                $.ajax({
                    url: 'retriveServlet',
                    method: 'POST',
                    data: dataString,
                    success: function (d) {
                        alert("form save" );
                        document.getElementById("myAjaxRequestForm").reset();
                    },
                    error: function (d) {
                        alert("error...");
                    }
                });
            });

//code for get data from database
            $("#fetchbtn").click(function (e) {

                $.ajax({
                    url: 'fetchServlet',
                    method: 'POST',
                    data: {"dt": "act"},
                    success: function (d) {
                        $('#setofdata').html(d);
                    },
                    error: function (d) {
                        alert("error...");
                    }
                });
            });

        </script>
    </body>
</html>




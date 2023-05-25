<!-- #include file="connect.asp" -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web đọc truyện</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-QzvsveSek0EUpu+K/ggG1B+UXpZcpvj3GvNiwuAQR6E79JQFZrQ4yaS5GfvsF8wz53nm2vUP0QGNEAI3SvlDhA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">

</head>
<style>
    /* Phần tổng */
    body{
        width: 100%;
        height: 750px;
        float: left;
    }
    .m40{
        margin:0 40px;
    }
    /* End tổng */
    /* Phần nacbar */
    .navbar{
        width: 100%;
        height: 50px;
        background-color: rgb(209, 198, 198);
        
    }
    /* End phần navbar */
    /* Phần sidebar */
    .sidebar{
        width: 20%;
        height: 700px;
        float: left;
    }
    
    .nav-item {
        display: flex;
        align-items: center;
    }

    .nav-link {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .material-symbols-outlined {
        display: flex;
        align-items: center;
    }
    /* End phần sidebar */

    /* Phần content */
    .content {
        /* display: flex; */
        height: 700px;
        width: 80%;
        margin-top: 10px;
        
    }
    


    
</style>
<body>
    <div class="navbar">
       <!-- #include file="navbar.asp" -->
    </div>
    <div class="noidung">
        <div class="sidebar">
            <!-- #include file="sidebar.asp" -->
        </div>
        
        <div class="content">
        <form id="myForm" method="post">
    <div class="form-check">
        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="Default radio">
        <label class="form-check-label" for="flexRadioDefault1">
            Default radio
        </label>
    </div>
    <br>
    <div class="form-check">
        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="Default checked radio" checked>
        <label class="form-check-label" for="flexRadioDefault2">
            Default checked radio
        </label>
    </div>
    <br>
</form>
<br>
    
    <button type="submit" class="btn btn-primary" onclick="submitForm()">Đăng truyện</button>
    <%
        Dim selectedValue
        selectedValue = ""

        If Request.Form("flexRadioDefault") <> "" Then
            selectedValue = Request.Form("flexRadioDefault")
        End If

        Response.Write("Tinh trang: " & selectedValue)
        %>

    </div>
    <div class="footer">
      <!-- #include file="footer.asp" -->
    </div>
    <script type="text/javascript">
    function submitForm() {
        var form = document.getElementById("myForm");
        form.submit();
    }
</script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
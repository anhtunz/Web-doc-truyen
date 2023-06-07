<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web đọc truyện</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">

    
</head>
<style>
    /* Thanh nav-bar */
    .nav-bar{
        justify-content:center;
        height: 50px;
        background-color: rgb(87, 234, 87);
        margin-bottom: 30px;
    }
    .m20{
        margin-right: 20px;
    }
    /* End nav-bar */

</style>
<body>
  <div class="nav-bar">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="#">Web đọc truyện</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="index.asp">Trang chủ<span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/qli_tryen_users/them_truyen.asp">Đăng truyện</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Thể loại
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="the_loai_truyen.asp?id_the_loai=1">Kiếm hiệp</a>
              <a class="dropdown-item" href="the_loai_truyen.asp?id_the_loai=2">Truyện teen</a>
              <a class="dropdown-item" href="the_loai_truyen.asp?id_the_loai=3">Ngôn tình</a>
              <a class="dropdown-item" href="the_loai_truyen.asp?id_the_loai=4">Truyện cười</a>
              <a class="dropdown-item" href="the_loai_truyen.asp?id_the_loai=5">Tiểu thuyết</a>
          </li>
        </ul>

        <form class="form-inline my-2 my-lg-0 m20" method="get" action="/find.asp">
          <input class="form-control mr-sm-2" type="search" placeholder="Tìm truyện, tác giả..." aria-label="Search" name ="searchInput">
          <button class="btn btn-secondary" type="submit">Tìm kiếm</button>
        </form>
        <% ' Mã ASP Classic để hiển thị kết quả nhập vào  
        searchInput = Request.QueryString("searchInput")
        
        %>
        
        <div>
          <%
              If (NOT isnull(Session("email"))) AND (TRIM(Session("email"))<>"") Then
          %>
            <span class="navbar-text">Xin chào <%=Session("email")%>!</span>
            <a href="/logout.asp" class="btn btn-light ms-3">Logout</a>
          <%                        
              Else
          %>                
            <a href="/login.asp" class="btn btn-primary">Đăng nhập</a>
          <%
                End If
          %>
        </div>

      </div>
    </div>
    </nav>
    
  </div>







    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


</body>
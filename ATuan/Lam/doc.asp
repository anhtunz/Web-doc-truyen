<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web đọc truyện</title>
    <link rel="stylesheet" href="style.css">
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
            <a class="nav-link" href="#">Trang chủ <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Đăng truyện</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Thể loại
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="#">Kiếm hiệp</a>
              <a class="dropdown-item" href="#">Truyện teen</a>
              <a class="dropdown-item" href="#">Ngôn tình</a>
              <a class="dropdown-item" href="#">Truyện cười</a>
              <a class="dropdown-item" href="#">Tiểu thuyết</a>
          </li>
        </ul>

        <form class="form-inline my-2 my-lg-0 m20">
          <input class="form-control mr-sm-2" type="search" placeholder="Tìm truyện, tác giả..." aria-label="Search">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Tìm kiếm</button>
        </form>
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
    
  </div>
  <div class="context">
    <div class="breadcrumb">
      <a href="#">Trang chủ</a> /
      <a href="#">Tên truyện</a> /
      <a href="#">Nội dung</a>
    </div>

    <div class="title">
      <h2>Tên truyện</h2>
      <p class="chapter">Tên chương</p>
      <p class="author">Tác giả</p>
      <div class="buttons">
        <button>Chương trước</button>
        <button>Mục lục</button>
        <button>Chương sau</button>
      </div>
    </div>
   
    <p>Xuyên qua phía trước Diệp Phong ba mươi tám tuổi, bụng bia, lớn hói đầu, thông suốt răng cửa, bộ dáng thực sự không dám khen tặng, cũng chính bởi vì như thế, ba mươi mấy người ngay cả một cái tức phụ nhi cũng không lăn lộn đến.</p>
    <p>Xuyên qua phía trước Diệp Phong ba mươi tám tuổi, bụng bia, lớn hói đầu, thông suốt răng cửa, bộ dáng thực sự không dám khen tặng, cũng chính bởi vì như thế, ba mươi mấy người ngay cả một cái tức phụ nhi cũng không lăn lộn đến.</p>
    <p>Xuyên qua phía trước Diệp Phong ba mươi tám tuổi, bụng bia, lớn hói đầu, thông suốt răng cửa, bộ dáng thực sự không dám khen tặng, cũng chính bởi vì như thế, ba mươi mấy người ngay cả một cái tức phụ nhi cũng không lăn lộn đến.</p>
    <p>Xuyên qua phía trước Diệp Phong ba mươi tám tuổi, bụng bia, lớn hói đầu, thông suốt răng cửa, bộ dáng thực sự không dám khen tặng, cũng chính bởi vì như thế, ba mươi mấy người ngay cả một cái tức phụ nhi cũng không lăn lộn đến.</p>
    <p>Xuyên qua phía trước Diệp Phong ba mươi tám tuổi, bụng bia, lớn hói đầu, thông suốt răng cửa, bộ dáng thực sự không dám khen tặng, cũng chính bởi vì như thế, ba mươi mấy người ngay cả một cái tức phụ nhi cũng không lăn lộn đến.</p>
    <p>Xuyên qua phía trước Diệp Phong ba mươi tám tuổi, bụng bia, lớn hói đầu, thông suốt răng cửa, bộ dáng thực sự không dám khen tặng, cũng chính bởi vì như thế, ba mươi mấy người ngay cả một cái tức phụ nhi cũng không lăn lộn đến.</p>
    <p>Xuyên qua phía trước Diệp Phong ba mươi tám tuổi, bụng bia, lớn hói đầu, thông suốt răng cửa, bộ dáng thực sự không dám khen tặng, cũng chính bởi vì như thế, ba mươi mấy người ngay cả một cái tức phụ nhi cũng không lăn lộn đến.</p>
    <p>Xuyên qua phía trước Diệp Phong ba mươi tám tuổi, bụng bia, lớn hói đầu, thông suốt răng cửa, bộ dáng thực sự không dám khen tặng, cũng chính bởi vì như thế, ba mươi mấy người ngay cả một cái tức phụ nhi cũng không lăn lộn đến.</p>
    <p>Xuyên qua phía trước Diệp Phong ba mươi tám tuổi, bụng bia, lớn hói đầu, thông suốt răng cửa, bộ dáng thực sự không dám khen tặng, cũng chính bởi vì như thế, ba mươi mấy người ngay cả một cái tức phụ nhi cũng không lăn lộn đến.</p>
    <p>Xuyên qua phía trước Diệp Phong ba mươi tám tuổi, bụng bia, lớn hói đầu, thông suốt răng cửa, bộ dáng thực sự không dám khen tặng, cũng chính bởi vì như thế, ba mươi mấy người ngay cả một cái tức phụ nhi cũng không lăn lộn đến.</p>
    <p>Xuyên qua phía trước Diệp Phong ba mươi tám tuổi, bụng bia, lớn hói đầu, thông suốt răng cửa, bộ dáng thực sự không dám khen tặng, cũng chính bởi vì như thế, ba mươi mấy người ngay cả một cái tức phụ nhi cũng không lăn lộn đến.</p>
    <p>Xuyên qua phía trước Diệp Phong ba mươi tám tuổi, bụng bia, lớn hói đầu, thông suốt răng cửa, bộ dáng thực sự không dám khen tặng, cũng chính bởi vì như thế, ba mươi mấy người ngay cả một cái tức phụ nhi cũng không lăn lộn đến.</p>
    <p>Xuyên qua phía trước Diệp Phong ba mươi tám tuổi, bụng bia, lớn hói đầu, thông suốt răng cửa, bộ dáng thực sự không dám khen tặng, cũng chính bởi vì như thế, ba mươi mấy người ngay cả một cái tức phụ nhi cũng không lăn lộn đến.</p>
    <p>Xuyên qua phía trước Diệp Phong ba mươi tám tuổi, bụng bia, lớn hói đầu, thông suốt răng cửa, bộ dáng thực sự không dám khen tặng, cũng chính bởi vì như thế, ba mươi mấy người ngay cả một cái tức phụ nhi cũng không lăn lộn đến.</p>
    <p>Xuyên qua phía trước Diệp Phong ba mươi tám tuổi, bụng bia, lớn hói đầu, thông suốt răng cửa, bộ dáng thực sự không dám khen tặng, cũng chính bởi vì như thế, ba mươi mấy người ngay cả một cái tức phụ nhi cũng không lăn lộn đến.</p>
    <p>Xuyên qua phía trước Diệp Phong ba mươi tám tuổi, bụng bia, lớn hói đầu, thông suốt răng cửa, bộ dáng thực sự không dám khen tặng, cũng chính bởi vì như thế, ba mươi mấy người ngay cả một cái tức phụ nhi cũng không lăn lộn đến.</p>
    <p>Xuyên qua phía trước Diệp Phong ba mươi tám tuổi, bụng bia, lớn hói đầu, thông suốt răng cửa, bộ dáng thực sự không dám khen tặng, cũng chính bởi vì như thế, ba mươi mấy người ngay cả một cái tức phụ nhi cũng không lăn lộn đến.</p>
    <p>Xuyên qua phía trước Diệp Phong ba mươi tám tuổi, bụng bia, lớn hói đầu, thông suốt răng cửa, bộ dáng thực sự không dám khen tặng, cũng chính bởi vì như thế, ba mươi mấy người ngay cả một cái tức phụ nhi cũng không lăn lộn đến.</p>
    <p>Xuyên qua phía trước Diệp Phong ba mươi tám tuổi, bụng bia, lớn hói đầu, thông suốt răng cửa, bộ dáng thực sự không dám khen tặng, cũng chính bởi vì như thế, ba mươi mấy người ngay cả một cái tức phụ nhi cũng không lăn lộn đến.</p>
    <p>Xuyên qua phía trước Diệp Phong ba mươi tám tuổi, bụng bia, lớn hói đầu, thông suốt răng cửa, bộ dáng thực sự không dám khen tặng, cũng chính bởi vì như thế, ba mươi mấy người ngay cả một cái tức phụ nhi cũng không lăn lộn đến.</p>
    <p>Xuyên qua phía trước Diệp Phong ba mươi tám tuổi, bụng bia, lớn hói đầu, thông suốt răng cửa, bộ dáng thực sự không dám khen tặng, cũng chính bởi vì như thế, ba mươi mấy người ngay cả một cái tức phụ nhi cũng không lăn lộn đến.</p>

   
    <!--Binh Luan-->
<div id="comment-section">
  <div class="buttons">
    <button>Chương trước</button>
    <button>Mục lục</button>
    <button>Chương sau</button>
  </div>
  <h2>Bình luận</h2>
  <form id="comment-form" method="post" action="comments.asp">
    <input type="text" name="username" placeholder="Nhập tên của bạn"><br>
    <textarea name="comment" placeholder="Nhập bình luận của bạn"></textarea><br>
    <button type="submit">Gửi</button>
  </form>
              <div class="d-flex justify-content-start align-items-center">
            <small>
                <div class="userinfo">
                    <strong style="font-size: 16px; color: blue"><%=rs("UserName")%></strong>
                    <i class="fa fa-circle"></i> <%=rs("CreatedAt")%>
                </div>
                <p style="font-size: 16px; color: black"><%=rs("CommentText")%></p>
            </small>
            <div class="acts ml-auto">
                <a href="#comment-list" style="color: red">Thích</a>
                <a href="DeleteComments.asp?ID=<%=rs("ID")%>" > Xóa </a>
            </div>
        </div>
  

</div>
  </div>


    <!-- Phần footer -->
    <div class="footer">
      <!-- Footer -->
    <footer class="bg-dark text-center text-white">
      <!-- Grid container -->
      <div class="container p-4">
        <!-- Section: Social media -->
        <section class="mb-4">
          <!-- Facebook -->
          <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button" style="border-radius: 50%;"
            ><i class="bi bi-facebook"></i
          ></a>
    
          <!-- Twitter -->
          <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button" style="border-radius: 50%;"
            ><i class="bi bi-twitter"></i
          ></a>
    
          <!-- Google -->
          <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button" style="border-radius: 50%;"
            ><i class="bi bi-google"></i
          ></a>
    
          <!-- Instagram -->
          <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button" style="border-radius: 50%;"
            ><i class="bi bi-instagram"></i
          ></a>
    
          <!-- Linkedin -->
          <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button" style="border-radius: 50%;"
            ><i class="bi bi-linkedin"></i
          ></a>
    
          <!-- Github -->
          <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button" style="border-radius: 50%;"
            ><i class="bi bi-github"></i
          ></a>
        </section>
        <!-- Section: Social media -->
    
        <!-- Section: Form -->
        <section class="">
          
        </section>
        <!-- Section: Form -->
    
        <!-- Section: Text -->
        <section class="mb-4">
          <p>
            Trang web được code bởi nhóm 25 cho môn Đồ Án Công Nghệ Thiết Kế Web nâng cao. Giáo viên 
            phụ trách: Nguyễn Thanh Bản
          </p>
        </section>
        <!-- Section: Text -->
    
        <!-- Section: Links -->
        <section class="" >
          <h5>Thông tin thành viên của nhóm</h5>
          <!--Grid row-->
          <div class="row" style="align-items: center;justify-content: center;">
            <!--Grid column-->
          <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
              <h5 class="text-uppercase">Trần Anh Tuấn</h5>
          
              <ul class="list-unstyled mb-0">
                  <li>
                      <a href="#!" class="text-white">Facebook</a>
                  </li>
                  <li>
                      <a href="#!" class="text-white">Email</a>
                  </li>
                  <li>
                      <a href="#!" class="text-white">Instagram</a>
                  </li>
                  <li>
                      <a href="#!" class="text-white">GitHub</a>
                  </li>
              </ul>
          </div>
            <!--Grid column-->
  
    
            <!--Grid column-->
            <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
              <h5 class="text-uppercase">Tạ Quốc Việt</h5>
          
              <ul class="list-unstyled mb-0">
                  <li>
                      <a href="#!" class="text-white">Facebook</a>
                  </li>
                  <li>
                      <a href="#!" class="text-white">Email</a>
                  </li>
                  <li>
                      <a href="#!" class="text-white">Instagram</a>
                  </li>
                  <li>
                      <a href="#!" class="text-white">GitHub</a>
                  </li>
              </ul>
          </div>
            <!--Grid column-->
    
            <!--Grid column-->
            <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
              <h5 class="text-uppercase">Doãn Tùng Lâm</h5>
          
              <ul class="list-unstyled mb-0">
                  <li>
                      <a href="#!" class="text-white">Facebook</a>
                  </li>
                  <li>
                      <a href="#!" class="text-white">Email</a>
                  </li>
                  <li>
                      <a href="#!" class="text-white">Instagram</a>
                  </li>
                  <li>
                      <a href="#!" class="text-white">GitHub</a>
                  </li>
              </ul>
          </div>
            <!--Grid column-->
          </div>
          <!--Grid row-->
        </section>
        <!-- Section: Links -->
      </div>
      <!-- Grid container -->
    
      <!-- Copyright -->
      <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
        © 2020 Copyright:
        <a class="text-white" href="https://huce.edu.vn/">Trường Đại Học Xây Dựng Hà Nội</a>
      </div>
      <!-- Copyright -->
    </footer>
    <!-- Footer -->
    </div>








    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


</body>
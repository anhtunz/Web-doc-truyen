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
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        text-align: center;
        height: 700px;
        width: 80%;
        
    }
    .eooo{
        margin-bottom: 20px;
    }
    .field-name,
    .field-value{
        font-size: 20px;
    }
    .info-row{
        margin-bottom: 5px;
    }
    
</style>
<body>

    <div class="navbar">
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid" style="margin-bottom: 10px;">
              <a class="navbar-brand" href="#">Trang chủ</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent" style="float: right;margin-left: 600px;">                
                <form class="d-flex" role="search">
                    <span class="navbar-text" style="margin-right: 650px;">Xin chào TunzTunz!</span>
                    <button type="button" class="btn btn-outline-primary">Đăng xuất</button>
                </form>
              </div>
            </div>
          </nav>
    </div>
    <div class="noidung">
        <div class="sidebar">
            <div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 100%;height: 100%;">
                <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
                    <span class="material-symbols-outlined" style="padding-right: 10px;font-size: 50px;">
                        person_book
                    </span>
                    <h5>Web đọc truyện</h5>
                </a>
                <hr>
                <ul class="nav nav-pills flex-column mb-auto">
                  <li class="nav-item">
                    <a href="/test/thongtin_user.asp" class="nav-link link-dark">
                        <span class="material-symbols-outlined">
                            person
                            </span>
                        Thông tin cá nhân
                    </a>
                  </li>
                  <li>
                    <a href="/test/qli_truyen.asp" class="nav-link link-dark">
                        <span class="material-symbols-outlined">
                            list
                        </span>
                        Danh sách truyện
                    </a>
                  </li>
                  <li>
                    <a href="#" class="nav-link link-dark">
                      <span class="material-symbols-outlined">
                        add
                        </span>
                        Thêm truyện mới
                    </a>
                  </li>
                  
                </ul>
                <hr>
                <div class="dropdown">
                  <a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle" id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
                    <strong>TunzTunz</strong>
                  </a>
                  <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2">
                    <li><a class="dropdown-item" href="#">Thêm truyện...</a></li>
                    <li><a class="dropdown-item" href="#">Cài đặt</a></li>
                    <li><a class="dropdown-item" href="/test/thongtin_user.asp">Trang cá nhân</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">Đăng xuất</a></li>
                  </ul>
                </div>
              </div>
        </div>
        <div class="content">
            <div class="eooo">
                <h2>THÔNG TIN CÁ NHÂN</h2>
            </div>
            <div class="thongtin">
                <div class="personal-info">
                <%
                    ' Kết nối đến cơ sở dữ liệu
                    Set conn = Server.CreateObject("ADODB.Connection")
                    conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456;"
                    ' Truy vấn dữ liệu từ bảng nguoi_dung với id_nguoi_dung = 1
                    sql = "SELECT * FROM nguoi_dung WHERE id_nguoi_dung = 1"
                    Set rs = conn.Execute(sql)

                    ' Kiểm tra xem có bản ghi nào hay không
                    If Not rs.EOF Then
                        ' Hiển thị thông tin người dùng
                        ngay_sinh = rs("ngay_sinh")
    
                        ' Định dạng lại ngày tháng năm
                        ngay_sinh = FormatDateTime(ngay_sinh, 1) ' 1: Hiển thị ngày tháng năm
                %>
                    <div class="info-row">
                      <span class="field-name">Tên:</span>
                      <span class="field-value fw-bold"><%=rs("ho_ten")%></span>
                    </div>
                    <div class="info-row">
                      <span class="field-name">Email:</span>
                      <span class="field-value"><%=rs("email")%></span>
                    </div>
                    <div class="info-row">
                      <span class="field-name">Ngày sinh:</span>
                      <span class="field-value"><%=ngay_sinh%></span>
                    </div>
                    <div class="info-row">
                      <span class="field-name">Nghệ danh:</span>
                      <span class="field-value fw-bold"><%=rs("nghe_danh")%></span>
                    </div>
                    <div class="info-row">
                      <span class="field-name">Giới tính:</span>
                      <span class="field-value"><%=rs("gioi_tinh")%></span>
                    </div>
                    <div class="info-row m40">
                      <span class="field-name">Giới thiệu:</span>
                      <span class="field-value">
                        <%=rs("gioi_thieu")%>
                      </span>
                      <%
                        Else
                            ' Không tìm thấy người dùng
                            Response.Write "Không tìm thấy thông tin người dùng."
                        End If

                        ' Đóng kết nối và giải phóng tài nguyên
                        rs.Close
                        Set rs = Nothing
                        conn.Close
                        Set conn = Nothing
                        %>
                    </div>
                  </div>
            </div>
            
    
        </div>
    </div>
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
                        <a href="https://www.facebook.com/anhtuan100402" class="text-white">Facebook</a>
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
    
    
    
    

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
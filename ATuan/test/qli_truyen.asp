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
        height: 900px;
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
        height: 750px;
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
    height: 750px;
    width: 80%;
  }

  .table {
    table-layout: fixed;
  }

  .table td.text-center {
    word-break: break-word;
    max-width: 200px; /* Điều chỉnh độ rộng tối đa của cột */
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }
    
</style>
<body>
    <%
    function Ceil(Number)
        Ceil = Int(Number)
        if Ceil<>Number Then
            Ceil = Ceil + 1
        end if
    end function
    function checkPage(cond, ret) 
        if cond=true then
            Response.write ret
        else
            Response.write ""
        end if
    end function
    page = Request.QueryString("page")
    limit = 10

    if (trim(page) = "") or (isnull(page)) then
        page = 1
    end if

    offset = (Clng(page) * Clng(limit)) - Clng(limit)

    strSQL = "SELECT COUNT(id_truyen) AS count FROM truyen"
    connDB.Open()
    Set CountResult = connDB.execute(strSQL)

    totalRows = CLng(CountResult("count"))

    Set CountResult = Nothing
    ' lay ve tong so trang
    pages = Ceil(totalRows/limit)
    %>
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
                    <a href="/test/dangtruyen.asp" class="nav-link link-dark">
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
          <div class="dan">
            <h2>DANH SÁCH TRUYỆN</h2>
          </div>
          <div class="dsach-truyen" style="width: 90%;">
            <table class="table table-striped">
              <thead class="thead-dark">
                <tr >
                  <th scope="col" class="text-center">Tên truyện</th>
                  <th scope="col" class="text-center">Năm xuất bản</th>
                  <th scope="col" class="text-center">Thể loại</th>
                  <th scope="col" class="text-center">Mô tả nội dung</th>
                  <th scope="col" class="text-center">Số chương</th>
                  <th scope="col" class="text-center">Tình trạng</th>
                  <th scope="col" class="text-center">Thao tác</th>
                </tr>
              </thead>
              <tbody>
              <%
                  Set cmdPrep = Server.CreateObject("ADODB.Command")
                  cmdPrep.ActiveConnection = connDB
                  cmdPrep.CommandType = 1
                  cmdPrep.Prepared = True
                  cmdPrep.CommandText = "SELECT * FROM truyen ORDER BY id_truyen OFFSET ? ROWS FETCH NEXT ? ROWS ONLY"
                  cmdPrep.parameters.Append cmdPrep.createParameter("offset",3,1, ,offset)
                  cmdPrep.parameters.Append cmdPrep.createParameter("limit",3,1, , limit)
                  Set Result = cmdPrep.execute
                  do while not Result.EOF
                %>
                <tr onclick="redirectToTruyenDetail(<%=Result("id_truyen")%>)">
                  <th scope="row" class="text-center"><%=Result("id_truyen")%></th>
                  <td class="text-center"><%=Result("ten_truyen")%></td>
                  <td class="text-center"><%=Result("nam_xb")%></td>
                  <td class="text-center"><%=Result("mo_ta_ndung")%></td>
                  <td class="text-center"><%=Result("so_chuong")%></td>
                  <td class="text-center"><%=Result("tinh_trang")%></td>
                  <td class="text-center">
                    <button type="button" class="btn btn-primary">Sửa</button>
                    <button type="button" class="btn btn-danger">Xóa</button>
                  </td>
                </tr>
              </tbody>
              <%
                        Result.MoveNext
                            loop
                        ' Đóng kết nối CSDL
                        Result.Close
                        
                        Set Result = Nothing
                        Set conn = Nothing
                %>
            </table>
          </div>
          <nav aria-label="Page Navigation">
                <ul class="pagination pagination-sm">
                    <% if (pages>1) then 
                        for i= 1 to pages
                    %>
                        <li class="page-item <%=checkPage(Clng(i)=Clng(page),"active")%>"><a class="page-link" href="qli_truyen.asp?page=<%=i%>"><%=i%></a></li>
                    <%
                        next
                        end if
                    %>
                </ul>
            </nav>
    
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
        <script>
          function redirectToTruyenDetail(id) {
            window.location.href = "qli_chuong.asp?id_truyen=" + id;
          }
        </script>
    
    
    

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
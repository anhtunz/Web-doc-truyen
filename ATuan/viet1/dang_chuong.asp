<!-- #include file="connect.asp" -->

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web đọc truyện</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css"
        integrity="sha512-QzvsveSek0EUpu+K/ggG1B+UXpZcpvj3GvNiwuAQR6E79JQFZrQ4yaS5GfvsF8wz53nm2vUP0QGNEAI3SvlDhA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">

</head>
<style>
    /* Phần tổng */
    body {
        width: 100%;
        height: 750px;
        float: left;
    }

    .m40 {
        margin: 0 40px;
    }

    /* End tổng */
    /* Phần nacbar */
    .navbar {
        width: 100%;
        height: 50px;
        background-color: rgb(209, 198, 198);

    }

    /* End phần navbar */
    /* Phần sidebar */
    .sidebar {
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
        /* flex-direction: column;
        /* justify-content: center;
        align-items: center;
        text-align: center; */
        height: 700px;
        width: 80%;
        background-color: antiquewhite;
        margin-top: 10px;
    }

    .Chuong {
        display: flex;
    }

    .thongbao1 {
        display: flex;
    }

    #preview-container {
        display: flex;
        flex-wrap: wrap;
    }

    .preview-image {
        width: 200px;
        height: auto;
        margin: 10px;
    }

    .divflex {
        display: flex;

    }

    .left-div {
        display: flex;
        width: 45%;
    }

    .card-title,
    .card-footer {
        display: flex;
        justify-content: center;
        align-items: center;
    }
</style>
<%
    Dim id_truyen
    id_truyen = Request.QueryString("id_truyen") ' Lấy giá trị id_truyen từ URL
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

    strSQL = "SELECT COUNT(id_chuong) AS count " & _
      "FROM chuong " & _
      "WHERE id_truyen = " & id_truyen
    connDB.Open()
    Set CountResult = connDB.execute(strSQL)

    totalRows = CLng(CountResult("count"))

    Set CountResult = Nothing
    ' lay ve tong so trang
    pages = Ceil(totalRows/limit)
    %>
<body>

    <div class="navbar">
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid" style="margin-bottom: 10px;">
                <a class="navbar-brand" href="#">Trang chủ</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent"
                    style="float: right;margin-left: 600px;">
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
                        <a href="#" class="nav-link link-dark">
                            <span class="material-symbols-outlined">
                                person
                            </span>
                            Thông tin cá nhân
                        </a>
                    </li>
                    <li>
                        <a href="#" class="nav-link link-dark">
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
                    <a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle"
                        id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
                        <strong>TunzTunz</strong>
                    </a>
                    <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2">
                        <li><a class="dropdown-item" href="#">Thêm truyện...</a></li>
                        <li><a class="dropdown-item" href="#">Cài đặt</a></li>
                        <li><a class="dropdown-item" href="#">Trang cá nhân</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">Đăng xuất</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="content">

            <div class="card card-primary" style="width: 100%;">
                <div class="card-header">
                    <h2 class="card-title" style=" color: green">Thêm chương truyện</h2>
                </div>

                <!-- /.card-header -->
                <!-- form start -->
                <form method="post" action="test.asp">
                    <div class="card-body">
                        <div>
                        <%
                        
    If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
        Dim Chuongso, SoChuong, Noidung
        ChuongSo = Request.Form("ChuongSo_nhap")
        TenChuong = Request.Form("TenChuong_nhap")
        NoiDung = Request.Form("NoiDungChuong")

        ' Gửi dữ liệu đến trang test.asp
        Dim xmlhttp
        Set xmlhttp = Server.CreateObject("MSXML2.ServerXMLHTTP")
        Dim url
        url = "test.asp"
        xmlhttp.Open "POST", url, False
        xmlhttp.setRequestHeader "Content-Type", "application/x-www-form-urlencoded"
        xmlhttp.send "ChuongSo=" & Server.URLEncode(ChuongSo) & "&TenChuong=" & Server.URLEncode(TenChuong) & "&NoiDung=" & Server.URLEncode(NoiDung) 

        ' Kiểm tra phản hồi từ trang test.asp
        If xmlhttp.Status = 200 Then
            Response.Write("Dữ liệu đã được gửi thành công.")
        Else
            Response.Write("Có lỗi xảy ra khi gửi dữ liệu.")
        End If
    End If
%>
                        <a class="btn btn-info" href="qli_chuong.asp?id_truyen=<%=id_truyen%>"><b>Xem danh sách chương</b></a>
                        </div>
                        <div class="Chuong" style="padding: 10px 10px 10px 0px">
                            <strong name="ChuongSo" style="margin-right: 40px;">Chương Số </strong>
                            <strong name="TenChuong">Tên Chương </strong>
                        </div>
                        <div class="Chuong">

                            <input name="ChuongSo_nhap" class="form-control" id="ChuongSo_nhap" placeholder="1" 
                                style="width: 85px;margin-right: 40px;">
                            <input name="TenChuong_nhap" class="form-control" id="TenChuong_nhap" 
                                placeholder="Nhập tên chương tại dây">
                        </div>
                        <div class="thongbao1">
                            <p class="text-danger font-italic" style="margin-right: 50px;">Chỉ nhập số</p>
                            <p class="text-danger font-italic">Chỉ nhập tên chương không nhập số chương ở đây. Nếu không
                                có tên, có thể để trống.</p>
                        </div>
                        <div class="alert alert-info">
                            Nội dung chương phải có ít nhất 400 từ mới có thể xuất bản. Khuyến khích 1 chương khoảng 2000 từ
                        </div>
                        <div class="mb-3">
                            <strong for="NoiDungChuong" class="form-label">Nội dung chương: </strong>
                            <textarea class="form-control" id="NoiDungChuong" rows="10" name="NoiDungChuong"
                                oninput="document.getElementById('word-counts').innerHTML = this.value.length + ' chữ'"></textarea>
                            <div id="word-counts">0 chữ</div>
                        </div>

                        <!-- /.card-body -->

                        <div class="card-footer">
                            <button type="submit" class="btn btn-primary" onclick="redirectToTruyenDetail(<%=("id_truyen")%>)" >Đăng chương</button>
                            <button type="submit" class="btn btn-default float-right">Hủy bỏ</button>
                        </div>
                </form>
            </div>
        </div>
    </div>
    <div class="footer">
      <!-- #include file="footer.asp" -->
    </div>
        <script>
          function redirectToTruyenDetail(id) {
            window.location.href = "test.asp?id_truyen=" + id;
          }
        </script>
    
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>

</body>
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
        height: 700px;
        width: 80%;
        margin-top: 10px;
        
    }
    .field-name,
    .field-value {
        font-size: 20px;
    }

    .TenTruyen {
        font-size: 20px;
        padding: 20px;
        width: 300px;
        height: 60px;
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
<body>
    <div class="navbar">
       <!-- #include file="navbar.asp" -->
    </div>
    <div class="noidung">
        <div class="sidebar">
            <!-- #include file="sidebar.asp" -->
        </div>
        
        <div class="content">
            <div class="card card-primary" style="width: 100%;">
                <div class="card-header">
                    <h2 class="card-title" style=" color: blue">Thêm Truyện Mới</h2>
                </div>

                <%
                    If (isnull(Session("email")) OR TRIM(Session("email")) = "") Then
                    Response.redirect("/login.asp")
                    End If
                    If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
                        Dim TenTruyen, SoChuong, NamXuatBan, AnhTruyen, TinhTrang, MoTa
                        TenTruyen = Request.Form("TenTruyen")
                        SoChuong = Request.Form("SoChuong")
                        NamXuatBan = Request.Form("NamXB")
                        AnhTruyen = Request.Form("Anhtruyen")
                        TinhTrang = Request.Form("flexRadioDefault")
                        TheLoai = Request.Form("flexRadioDefault1")
                        MoTa = Request.Form("gioithieu")

                        ' Gửi dữ liệu đến trang add_truyen_base.asp
                        Dim xmlhttp
                        Set xmlhttp = Server.CreateObject("MSXML2.ServerXMLHTTP")
                        Dim url
                        url = "add_truyen_base.asp"
                        xmlhttp.Open "POST", url, False
                        xmlhttp.setRequestHeader "Content-Type", "application/x-www-form-urlencoded"
                        xmlhttp.send "TenTruyen=" & Server.URLEncode(TenTruyen) & "&SoChuong=" & Server.URLEncode(SoChuong) & "&NamXB=" & Server.URLEncode(NamXuatBan) & "&Anhtruyen=" & Server.URLEncode(AnhTruyen) & "&flexRadioDefault=" & Server.URLEncode(TinhTrang) & "&gioithieu=" & Server.URLEncode(MoTa) & "&gioithieu=" & Server.URLEncode(TheLoai)

                        ' Kiểm tra phản hồi từ trang add_truyen_base.asp
                        If xmlhttp.Status = 200 Then
                            Response.Write("Dữ liệu đã được gửi thành công.")
                        Else
                            Response.Write("Có lỗi xảy ra khi gửi dữ liệu.")
                        End If
                    End If
                %>
                <div class="card-body">
                    <form id="myForm" method="post" action="add_truyen_base.asp">
                        <div>
                            <strong for="TenTruyen">Tên truyện:</strong>
                            <input type="text" class="TenTruyen" name="TenTruyen" placeholder="Nhập Tên truyện">
                        </div>
                        <div class="SoChuong">
                            <strong for="SoChuong">Số chương</strong>
                            <input type="text" class="form-control" name="SoChuong" placeholder="Số chương truyện">
                        </div>
                        <div class="NamXB">
                            <strong for="NamXB">Năm xuất bản</strong>
                            <input type="date" class="form-control" name="NamXB" placeholder="Định dang yy-mm-dd">
                        </div>
                        <div class="Anhtruyen">
                            <strong for="Anhtruyen">Ảnh truyện</strong>
                            <input type="text" class="form-control" name="Anhtruyen" placeholder="Vui lòng điền link ảnh">
                        </div>
                        <div class="divflex">
                            <div class="left-div">
                                <strong>Tình trạng :</strong>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="Full" style="display: flex; margin:2px; ">
                                    <label class="form-check-label" for="flexRadioDefault1">
                                        Full
                                    </label>
                                </div>
                                <div class="form-check" >
                                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="NotFull" style="display: flex; margin:2px; " checked>
                                    <label class="form-check-label" for="flexRadioDefault2">
                                        Chưa Full
                                    </label>
                                </div>
                            </div>
                            <div class="TheLoai" style="display: flex;">
                                <strong>Thể Loại: </strong>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="flexRadioDefault1" value="1"
                                    id="flexRadioDefault1" style=" margin-left:2px; ">
                                    <label class="form-check-label" for="flexRadioDefault1">
                                        Kiếm hiệp
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="flexRadioDefault1" value="2" style=" margin-left:2px; ">
                                    <label class="form-check-label">
                                        Truyện teen
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="flexRadioDefault1" value="3" style=" margin-left:2px; ">
                                    <label class="form-check-label" >
                                        Ngôn tình
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="flexRadioDefault1" value="4" style=" margin-left:2px; ">
                                    <label class="form-check-label">
                                        Truyện cười
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="flexRadioDefault1" value="5" style=" margin-left:2px; ">
                                    <label class="form-check-label" >
                                        Tiểu thuyết
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <strong for="gioithieu" class="form-label">Mô tả truyện</strong>
                            <textarea class="form-control" id="gioithieu" name="gioithieu" rows="8"></textarea>
                        </div>
                        <div class="card-footer">
                            <button type="submit" class="btn btn-primary" value="Đăng truyện">Đăng</button>
                            <button type="button" class="btn btn-default float-right">Hủy bỏ</button>
                        </div>
                    </form>
                </div>     
            </div>
        </div>
    </div>
    <div class="footer">
      <!-- #include file="footer.asp" -->
    </div>
        
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
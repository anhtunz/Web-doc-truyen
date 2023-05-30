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
    .thongbao1 {
        display: flex;
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
                    <h2 class="card-title" style=" color: green">Thêm chương truyện</h2>
                </div>

                <!-- /.card-header -->
                <!-- form start -->
                <form method="post" action="test.asp">
                    <div class="card-body">
                        <div>
                        <a class="btn btn-info" href="qli_chuong.asp?id_truyen=<%=id_truyen%>"><b>Xem danh sách chương</b></a>
                        </div>
                        <div class="Chuong" style="padding: 10px 10px 10px 0px">
                            <strong name="Chuong" style="margin-right: 40px;">Chương Số: Tiêu đều chương </strong>
                            <tr>
                            <input name="TenChuong_nhap" class="form-control" id="TenChuong_nhap" 
                                placeholder="Ví dụ Chương 1: Ở đây nhập tiêu đề của chương 1">
                        </div>
                        <div class="thongbao1">
                            <p class="text-danger font-italic">Bắt buộc phải nhập số chương mới được duyệt. Nếu không
                                có tiêu đề, có thể để trống.</p>
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
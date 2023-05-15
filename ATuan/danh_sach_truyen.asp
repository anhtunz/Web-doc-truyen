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

        <form class="form-inline my-2 my-lg-0 m20" method = "get">
          <input class="form-control mr-sm-2" type="search" placeholder="Tìm truyện, tác giả..." aria-label="Search" name ="searchInput" >
          <button type="submit" class="btn btn-secondary">Tìm kiếm</button>
        </form>
        <%
            Dim searchInput
            searchInput = Request.QueryString("searchInput")
            If searchInput <> "" Then
                Response.Write("Bạn vừa nhập: " & searchInput)
                Response.Redirect "/find.asp?searchInput=" & searchInput
            End If
        %>
        <% ' Mã ASP Classic để hiển thị kết quả nhập vào
            ' Lấy giá trị của tham số searchInput từ URL
            
            If searchInput <> "" Then ' Nếu có giá trị của tham số searchInput
                ' Hiển thị đoạn text vừa nhập ra màn hình
                Set conn = Server.CreateObject("ADODB.Connection")
                conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"

                ' Tạo truy vấn để lấy danh sách truyện liên quan
                sql = "SELECT truyen.ten_truyen, nguoi_dung.nghe_danh, truyen.so_chuong FROM truyen INNER JOIN nguoi_dung ON truyen.id_nguoi_dung = nguoi_dung.id_nguoi_dung WHERE ten_truyen LIKE '%" & searchInput & "%' OR nghe_danh LIKE '%" & searchInput & "%'"

                ' Thực hiện truy vấn
                Set rs = conn.Execute(sql)
                End If
        %>
        </div>
    </div>
    </nav>
  </div>  
                    <%
                        ' Kết nối đến CSDL
                        Set conn = Server.CreateObject("ADODB.Connection")
                        conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"

                        ' Truy vấn dữ liệu từ CSDL
                        Set rs = conn.Execute("SELECT truyen.ten_truyen, nguoi_dung.nghe_danh, truyen.so_chuong FROM truyen INNER JOIN nguoi_dung ON truyen.id_nguoi_dung = nguoi_dung.id_nguoi_dung")

                        ' Hiển thị dữ liệu
                        Do While Not rs.EOF
                    %>
                    
                    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                        <div class="d-flex justify-content-start">
                            <h5 class="mb-1"><%=rs("ten_truyen")%></h5>
                            <span class="badge badge-primary badge-pill" style="color: blue; border-radius: 40% ">Dịch</span>
                        </div>
                        <div class="d-flex w-100 justify-content-between">
                            <small>Tác giả: <%=rs("nghe_danh")%></small>
                            <small>Số chương: <%=rs("so_chuong")%></small>
                        </div>
                    </a>
                    <%
                        rs.MoveNext
                        Loop

                        ' Đóng kết nối CSDL
                        rs.Close
                        conn.Close
                        Set rs = Nothing
                        Set conn = Nothing
                    %>
                    
    









    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>


</body>
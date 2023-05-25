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
    <!-- #include file="phantrang.asp" -->
    <div class="navbar">
       <!-- #include file="navbar.asp" -->
    </div>
    <div class="noidung">
        <div class="sidebar">
            <!-- #include file="sidebar.asp" -->
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
    </div>
    <div class="footer">
      <!-- #include file="footer.asp" -->
    </div>
    
        <script>
          function redirectToTruyenDetail(id) {
            window.location.href = "qli_chuong.asp?id_truyen=" + id;
          }
        </script>
    


      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
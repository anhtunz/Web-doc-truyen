



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
     .truyen-chon-loc {
        display: flex;
        flex-wrap: wrap;
    }
  
    .card {
        flex: 1 0 25%; /* Chia tỷ lệ cân đối cho 4 card trên cùng một dòng */
        height: 100%; /* Chiều cao của card bằng chiều cao của thẻ cha */
        
    }
</style>
<body>
    <div class="truyen-chon-loc">
        <div class="container mt-4">
                <h4>TRUYỆN DỊCH CHỌN LỌC</h4>
                <div class="row mt-4">
                <%
                    ' Kết nối đến cơ sở dữ liệu
                    Dim conn, rs
                    Set conn = Server.CreateObject("ADODB.Connection")
                    conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"

                    ' Truy vấn dữ liệu từ table truyen
                    Dim sql
                    sql = "SELECT * FROM truyen WHERE id_truyen BETWEEN 8 AND 11"
                    Set rs = conn.Execute(sql)

                    ' Duyệt qua từng bản ghi trong kết quả truy vấn
                    Do While Not rs.EOF
                %>
                  <div class="col-md-3">
                    <div class="card">
                      <img src="<%=rs("anh_truyen")%>" class="card-img-top" alt="...">
                      <div class="card-body">
                        <h5 class="card-title"><%=rs("ten_truyen")%></h5>
                        <p class="card-text">Nội dung truyện đề cử 1</p>
                        <a href="#?id_truyen=<%=rs("id_truyen")%>" class="btn btn-primary">Đọc truyện</a>
                      </div>
                    </div>
                  </div>
                  <%
                    rs.MoveNext
                    Loop
                    rs.Close
                    conn.Close
                    Set rs = Nothing
                    Set conn = Nothing
                %>
        </div>
    </div>
            
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

</body>
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
  .carousel-image {
    object-fit: cover;
    object-position: center;
    width: 100%;
    height: 100%;
  }
</style>
<body>
    <div class="slider">
      <div class="tieude content-trai1-child h10 ">TRUYỆN ĐỀ CỬ</div>
              <div class="theloai content-trai1-child h10" style=" display: flex; align-items: center;margin-left: 10px;margin-bottom: 20px ">
                <button type="button" class="btn btn-dark mr-10" >Ngôn tình</button>
                <button type="button" class="btn btn-dark mr-10">Truyện teen</button>
                <button type="button" class="btn btn-dark mr-10">Truyện cười</button>
              </div>
              <div class="slide_truyen content-trai1-child">
                  <div class="slider">
                  <%
                    ' Kết nối đến cơ sở dữ liệu
                    Dim conn, rs
                    Set conn = Server.CreateObject("ADODB.Connection")
                    conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"

                    ' Truy vấn dữ liệu từ table truyen
                    Dim sql
                    sql = "SELECT TOP 5 * FROM truyen"
                    Set rs = conn.Execute(sql)
                  %>
                      <div id="carouselExampleCaptions" class="carousel slide">
                        <div class="carousel-indicators">
                        <% 
                          Dim i
                          i = 0
                          Do While Not rs.EOF 
                        %>
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="<%=i%>" <% If i = 0 Then Response.Write("class='active'") %> aria-current="true" aria-label="Slide <%=i+1%>"></button>
                        <% 
                          i = i + 1
                          rs.MoveNext
                          Loop
                          rs.Close 
                        %>
                          <button type="button " data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                          
                        </div>
                        <div class="carousel-inner">
                        <% 
                          rs.Open
                          i = 0
                          Do While Not rs.EOF 
                        %>
                          <div class="carousel-item <% If i = 0 Then Response.Write("active") %>">
                            <img src="<%=rs("anh_truyen")%>" class="d-block w-100 carousel-image"  alt="...">
                            <div class="carousel-caption d-none d-md-block">
                              <h5><%=rs("ten_truyen")%></h5>
                              <p>Some representative placeholder content for the first slide.</p>
                            </div>
                          </div>
                          <% 
                            i = i + 1
                            rs.MoveNext
                            Loop
                            rs.Close
                            conn.Close 
                          %>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                          <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                          <span class="carousel-control-next-icon" aria-hidden="true"></span>
                          <span class="visually-hidden">Next</span>
                        </button>
                      </div>
                      <%
                        Set rs = Nothing
                        Set conn = Nothing
                      %>
                    </div>
              </div> 

    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

</body>
<!-- #include file="connect.asp" -->
<!DOCTYPE html>
<html lang="vi" xml:lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web đọc truyện</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">

</head>
<style>
    /* Phần content */

    .content{
        height: 3000px;
        width: 70%;
        margin: 0 auto;
        box-sizing: border-box;
        
    } 

    /* Phần content trái */

    .content .content-trai{
        width: 65%;
        height: 2000px;
        float: left;
        display: flex;
        flex-direction: column;
    }

    .content .content-trai .content-trai1{  
        width: 100%;
        height: 400px;
        margin-bottom: 20px;
    } 

    .content .content-trai .content-trai1 .slide_truyen{ 
        height: 320px;
        position: relative;
    }

    .content .content-trai .content-trai1 .slide_truyen .slider{
        width:100%;
    }
    .carousel-image{
        max-height: 330px;
        width: 100%;
        object-fit: cover;
    }   


    /* End content trai 1 */

    .content .content-trai .content-trai2{  
        width: 100%;
        height: 850px;
        
        margin-bottom: 10px;
        
    } 
    /* .content .content-trai .content-trai3{  
        width: 100%;
        height:25%;
        background-color: green;
        margin-bottom: 10px;
    }  */

    /* .content .content-trai .content-trai4{  
        width: 100%;
        height:25%;
        background-color: black;
    }  */

    /* End content trái */

    /* Phần content giữa */

    .content .content-giua{
        float: left;
        width: 5%;
        height: 1000px;

    }

    /* End content giữa */


    /* Phần content phải */
    .content .content-phai{
        width: 30%;
        height: 1000px;
        float: left;
    }

    /* End content phải */
</style>
<body>

    <div class="content">
        <div class="content-trai">
                <div class="content-trai1">
                    <div class="list-group">
                    <h4>TRUYỆN MỚI CẬP NHẬT</h4>
                        <%
                            set connDB = Server.CreateObject("ADODB.Connection")
                            connDB.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"
                            Set cmdPrep = Server.CreateObject("ADODB.Command")
                            cmdPrep.ActiveConnection = connDB
                            cmdPrep.CommandType = 1
                            cmdPrep.Prepared = True
                            cmdPrep.CommandText = "SELECT TOP 10 truyen.id_truyen, truyen.ten_truyen, chuong.ten_chuong FROM truyen INNER JOIN chuong ON truyen.id_truyen = chuong.id_truyen ORDER BY truyen.id_truyen DESC"
                            ' Thực thi câu lệnh SQL và đưa kết quả vào thẻ div
                            Set Result = cmdPrep.Execute
                            While Not Result.EOF
                                %>
                                <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                                    <div class="d-flex justify-content-start">
                                        <h5 class="mb-1"><%= Result("ten_truyen") %></h5>
                                        <span class="badge badge-primary badge-pill" style="color: blue; border-radius: 40% ">Dịch</span>
                                    </div>
                                    <div class="d-flex w-100 justify-content-between">
                                        <%=Result("ten_chuong")%>
                                        <small>3 days ago</small>
                                </div>
                                </a>
                                <%
                                Result.MoveNext
                            Wend

                            ' Đóng kết nối
                            connDB.Close
                        %>
                    
                    
            
                </div>
                </div>
                <div class="content-trai2">
                  
                </div>
                <div class="content-trai3">
                  
                </div>
                <div class="content-trai4">
                </div>
        </div>
        <div class="content-giua"></div>
        <div class="content-phai">
          
        </div>
    </div>
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

</body>
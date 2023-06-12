 <!-- #include file="connect.asp" -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web đọc truyện</title>
    <link rel="stylesheet" href="style.css">
  
    
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
 /* Phần chỉnh sửa chương */
    .edit-section {
        max-width: 500px;
        margin: 0 auto;
        padding: 20px;
        background-color: #f0f0f0;
        border-radius: 5px;
    }
    
    .edit-section h2 {
        margin-bottom: 10px;
        text-align: center;
    }
    
    .edit-section input[type="text"],
    .edit-section textarea {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    
    .edit-section input[type="submit"] {
        display: block;
        width: 100%;
        padding: 10px;
        background-color: rgb(87, 234, 87);
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
</style>
<body>
  <!-- Phần navbar -->
    <!-- #include file="navbar1.asp" -->
   
<!-- Phần chỉnh sửa chương -->
<div class="edit-section">
    <h2>Chỉnh sửa chương</h2>
    <form action="edit_chapter.asp" method="post">
        <!-- Các trường form để chỉnh sửa chương -->
        <input type="text" name="chapter_title" placeholder="Tiêu đề chương" />
        <textarea name="chapter_content" placeholder="Nội dung chương"></textarea>
        <input type="submit" value="Lưu" />
    </form>
</div>



   

  <!-- Phần footer -->
    <!-- #include file="footer.asp" -->

  </div>


</body>
</html>
    
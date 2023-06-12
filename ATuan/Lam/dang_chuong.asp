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
 .create-chapter-section {
        max-width: 600px;
        margin: 0 auto;
        padding: 20px;
        background-color: #f8f8f8;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .create-chapter-section h2 {
        text-align: center;
        margin-bottom: 20px;
    }

    .create-chapter-section form {
        display: flex;
        flex-direction: column;
    }

    .create-chapter-section input[type="text"],
    .create-chapter-section textarea {
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 3px;
    }

    .create-chapter-section input[type="submit"] {
        padding: 10px 20px;
        background-color: #4caf50;
        color: #fff;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }

    .create-chapter-section input[type="submit"]:hover {
        background-color: #45a049;
    }
</style>
<body>
  <!-- Phần navbar -->
    <!-- #include file="navbar1.asp" -->
   
<!-- Phần đăng chương truyện -->
<div class="create-chapter-section">
    <h2>Đăng chương truyện</h2>
    <form action="create_chapter.asp" method="post">
        <input type="hidden" name="id_truyen" value="1" /> <!-- Thay đổi giá trị id_truyen tùy thuộc vào truyện nào đang được đăng -->
        <input type="text" name="chapter_title" placeholder="Tiêu đề chương" required />
        <textarea name="chapter_content" placeholder="Nội dung chương" required></textarea>
        <input type="submit" value="Đăng" />
    </form>
</div>




  <!-- Phần footer -->
    <!-- #include file="footer.asp" -->

  </div>


</body>
</html>
    
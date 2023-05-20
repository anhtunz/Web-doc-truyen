

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
        background-color: aqua;
    }
    /* End phần navbar */
    /* Phần sidebar */
    .sidebar{
        width: 20%;
        height: 700px;
        float: left;
        background-color: aqua;
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
    .eooo{
        margin-bottom: 20px;
    }
    .field-name,
    .field-value{
        font-size: 20px;
    }
    
</style>
<body>
    <div class="navbar">
        
    </div>
    <div class="noidung">
        <div class="sidebar">
            <div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark" style="width: 100%;height: 100%;">
                <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                    <span class="material-symbols-outlined" style="padding-right: 10px;font-size: 50px;">
                        person_book
                    </span>
                    <h5>Web đọc truyện</h5>
                </a>
                <hr>
                <ul class="nav nav-pills flex-column mb-auto">
                    <li class="nav-item">
                        <a href="#" class="nav-link text-white " aria-current="page" >
                            <span class="material-symbols-outlined icon-center" >
                            Home
                            </span>
                            Trang chủ
                        </a>
                    </li>
                    <li>
                        <a href="#" class="nav-link text-white">
                            <span class="material-symbols-outlined">
                                person
                                </span>
                            Thông tin cá nhân
                        </a>
                    </li>
                    <li>
                        <a href="#" class="nav-link text-white">
                            <span class="material-symbols-outlined">
                                list
                            </span>
                            Danh sách truyện
                        </a>
                    </li>
                    <!-- <li>
                        <a href="#" class="nav-link text-white">
                            <svg class="bi me-2" width="16" height="16">
                                <use xlink:href="#grid"></use>
                            </svg>
                            Products
                        </a>
                    </li>
                    <li>
                        <a href="#" class="nav-link text-white">
                            <svg class="bi me-2" width="16" height="16">
                                <use xlink:href="#people-circle"></use>
                            </svg>
                            Customers
                        </a>
                    </li> -->
                </ul>
                <hr>
                <div class="dropdown">
                    <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
                        id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
                        <strong>TunzTunz</strong>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
                        <li><a class="dropdown-item" href="#">Thêm truyện</a></li>
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
            <div class="eooo">
                <h2>THÔNG TIN CÁ NHÂN</h2>
            </div>
            <div class="thongtin">
                <div class="personal-info">
                    <div class="info-row">
                      <span class="field-name">Tên:</span>
                      <span class="field-value fw-bold">John Doe</span>
                    </div>
                    <div class="info-row">
                      <span class="field-name">Email:</span>
                      <span class="field-value">johndoe@example.com</span>
                    </div>
                    <div class="info-row">
                      <span class="field-name">Ngày sinh:</span>
                      <span class="field-value">10/10/1990</span>
                    </div>
                    <div class="info-row">
                      <span class="field-name">Nghệ danh:</span>
                      <span class="field-value fw-bold">Superstar</span>
                    </div>
                    <div class="info-row">
                      <span class="field-name">Giới tính:</span>
                      <span class="field-value">Nam</span>
                    </div>
                    <div class="info-row m40">
                      <span class="field-name">Giới thiệu:</span>
                      <span class="field-value">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu arcu mauris.
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu arcu mauris
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu arcu mauris
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu arcu mauris
    
                      </span>
                    </div>
                  </div>
            </div>
            
    
        </div>
    </div>
    
    
    
    

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
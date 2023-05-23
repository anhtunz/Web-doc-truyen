

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
        align-items: center ;
        justify-content: ;
        text-align: ;
        height: 100%;
        width: 1200px;
        box-shadow: 0 0 1px;
        margin-bottom: 1rem;
        
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
    .divflex {
        display: flex;

        }
    .left-div {
            display: flex;
            width:45%;
        }
        
    .right-div{
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
                        <a href="/test/thongtin_user.asp" class="nav-link text-white">
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
            <div class="card card-primary">
              <div class="card-header">
                <h2 class="card-title" style=" color: blue">Thêm Truyện Mới</h2>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form>
                <div class="card-body">
                  <div >
                    <input type="TenTruyen" class="TenTruyen" id="TenTruyen" placeholder="Nhập Tên truyện">
                  </div>
                  <div class="TacGia" >
                    <strong for="TacGia">Tác giả</strong>
                    <input type="TacGia" class="form-control" id="TacGia" placeholder="Tên tác giả">
                  </div>
                  <div class= "divflex">
                  <div class="left-div">
                        <div class="LoaiTruyen">
                            <strong for="LoaiTruyen">Loại truyện</strong>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="loaitruyen">
                                        Truyện dịch
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="loaitruyen" >
                                        Truyện sáng tác
                                </div>
                        </div>
                        <div class="TinhTrang">
                            <strong >Tình Trạng Truyện</strong>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="tinhtrang">
                                        Đã hoàn thành
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="tinhtrang">
                                        Đang dịch / Đang Convert
                                </div>
                        </div>
                  </div>
                    
                    <div class="right-div">
                        <input type="file" id="image-input" multiple>
                            <div id="preview-container"></div>

                            <script>
                                function previewImages() {
                                    var previewContainer = document.getElementById('preview-container');
                                    var files = document.getElementById('image-input').files;
                                    previewContainer.innerHTML = '';
                                    for (var i = 0; i < files.length; i++) {
                                        var file = files[i];
                                        var img = document.createElement('img');
                                        img.classList.add('preview-image');
                                        img.src = URL.createObjectURL(file);
                                        previewContainer.appendChild(img);
                                    }
                                }
                                document.getElementById('image-input').addEventListener('change', previewImages);
                            </script>
                    </div>
                    <div>
                    <div class="TheLoai">
                            <strong >Thể Loại</strong>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="TheLoai">
                                        Kiếm hiệp
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="TheLoai">
                                        Cổ trang
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="TheLoai">
                                        tình cảm
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="TheLoai">
                                        trinh thám
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="TheLoai">
                                        thám hiểm
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="TheLoai">
                                        kinh dị
                                </div>
                        </div>
                    </div>
                  </div>
                <div class="mb-3">
                    <strong for="gioithieu" class="form-label">Mô tả truyện</strong>
                    <textarea class="form-control" id="gioithieu" rows="3"></textarea>
                </div>

                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Đăng truyện</button>
                  <button type="submit" class="btn btn-default float-right">Hủy bỏ</button>
                </div>
              </form>
            </div>
        </div>
    </div>
    
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
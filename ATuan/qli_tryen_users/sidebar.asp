
<%
    email = Session("email")
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"
    
    sql = "SELECT * FROM nguoi_dung WHERE email = '" & email & "'"
    
    Set rs = conn.Execute(sql)
 %>

<div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 100%;height: 100%;">
                <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
                    <span class="material-symbols-outlined" style="padding-right: 10px;font-size: 50px;">
                        person_book
                    </span>
                    <h5>Web đọc truyện</h5>
                </a>
                <hr>
                <ul class="nav nav-pills flex-column mb-auto">
                  <li class="nav-item">
                    <a href="info.asp?id_nguoi_dung=<%= rs("id_nguoi_dung") %>" class="nav-link link-dark">
                        <span class="material-symbols-outlined">
                            person
                            </span>
                        Thông tin cá nhân
                    </a>
                  </li>
                  <li>
                    <a href="qli_truyen.asp?id_nguoi_dung=<%= rs("id_nguoi_dung") %>" class="nav-link link-dark">
                        <span class="material-symbols-outlined">
                            list
                        </span>
                        Danh sách truyện
                    </a>
                  </li>
                  <li>
                    <a href="them_truyen.asp?id_nguoi_dung=<%= rs("id_nguoi_dung") %>" class="nav-link link-dark">
                      <span class="material-symbols-outlined">
                        add
                        </span>
                        Thêm truyện mới
                    </a>
                  </li>
                  
                </ul>
                <hr>
                <div class="dropdown">
                  <a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle" id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="https://toigingiuvedep.vn/wp-content/uploads/2022/04/meme-cheems-anh-meme-cheems.jpg" alt="" width="32" height="32" class="rounded-circle me-2">
                    <strong><%= rs("nghe_danh") %></strong>
                  </a>
                  <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2">
                    <li><a class="dropdown-item" href="them_truyen.asp?id_nguoi_dung=<%= rs("id_nguoi_dung") %>">Thêm truyện...</a></li>
                    <li><a class="dropdown-item" href="#">Cài đặt</a></li>
                    <li><a class="dropdown-item" href="info.asp?id_nguoi_dung=<%= rs("id_nguoi_dung") %>">Trang cá nhân</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">Đăng xuất</a></li>
                  </ul>
                </div>
              </div>
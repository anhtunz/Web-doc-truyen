<script>
            // Lấy tất cả các key trong Local Storage
            var keys = Object.keys(localStorage);
            // Duyệt qua từng key và hiển thị key và giá trị tương ứng
            for (var i = 0; i < keys.length; i++) {
                var key = keys[i];
                var value = localStorage.getItem(key);
                var integerValue = parseInt(value); // Chuyển giá trị thành kiểu số nguyên
                document.write("Key: " + key + ", Value (as integer): " + integerValue + "<br>");
                <% 
                    Dim valueFromLocalStorage
                    valueFromLocalStorage = "Value: " & integerValue & "<br>"
                    Response.Write(valueFromLocalStorage)
                    %>
            } 
          </script>
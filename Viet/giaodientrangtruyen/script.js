document.getElementById("comment-form").addEventListener("submit", function(e) {
  e.preventDefault(); // Ngăn chặn gửi form mặc định

  // Lấy tên người dùng từ input
  var nameInput = document.getElementById("name-input");
  var userName = nameInput.value;

  // Lấy nội dung bình luận từ input
  var commentInput = document.getElementById("comment-input");
  var commentText = commentInput.value;

  if (commentText.trim() !== "") {
    // Tạo phần tử bình luận mới
    var commentElement = document.createElement("div");
    commentElement.classList.add("comment");

    var authorElement = document.createElement("span");
    authorElement.classList.add("author");
    authorElement.innerText = userName;

    var dateElement = document.createElement("span");
    dateElement.classList.add("date");
    var date = new Date();
    dateElement.innerText = date.toLocaleString();

    var commentTextElement = document.createElement("p");
    commentTextElement.innerText = commentText;

    // Thêm các phần tử vào phần danh sách bình luận
    commentElement.appendChild(authorElement);
    commentElement.appendChild(dateElement);
    commentElement.appendChild(commentTextElement);

    var commentList = document.getElementById("comment-list");
    commentList.appendChild(commentElement);

    // Xóa nội dung trong input sau khi gửi bình luận
    commentInput.value = "";
  }
});

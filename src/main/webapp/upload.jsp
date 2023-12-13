<!-- upload.jsp -->
<!DOCTYPE html>
<html>
<head>
    <title>Image Upload</title>
</head>
<body>
<form action="storeImage.jsp">
    <h1>Image Upload</h1>
    <input type="file" id="imageInput" />
    <button onclick="uploadImage()">Upload</button>
    <div id="imagePreview"></div>

    <script>
        function uploadImage() {
            var fileInput = document.getElementById("imageInput");
            var file = fileInput.files[0];
            var reader = new FileReader();

            reader.onloadend = function () {
                var imagePreview = document.getElementById("imagePreview");
                imagePreview.innerHTML = '<img src="' + reader.result + '" alt="Uploaded Image" width="300" />';

                // Send the image data to the server using AJAX
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "storeImage.jsp", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        // Handle the server response if needed
                        console.log(xhr.responseText);
                    }
                };

                // Convert the image data to base64 and send as a parameter named "imageData"
                var imageData = reader.result.split(',')[1];
                xhr.send("imageData=" + encodeURIComponent(imageData));
            };
           
                if (file) {
                    reader.readAsDataURL(file);
                }

                // Debugging statement
                console.log("imageData:", reader.result);
            }
        </script>
     </form>   
</body>
</html>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>    
<html>
<head>
    <title></title>
    <meta charset="utf-8">
    <script type="text/javascript">
        var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
        function fileChange(target) {
            var fileSize = 0;
            if (isIE && !target.files) {
                var filePath = target.value;
                var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
                var file = fileSystem.GetFile(filePath);
                fileSize = file.Size;
            } else {
                fileSize = target.files[0].size;
            }
            var size = fileSize / 1024;
            if (size > 10000) {
                alert("附件不能大于10M");
            }
        }
    </script>
</head>
<body>
<form action="fileAction.action" method="post" enctype="multipart/form-data">
    <input type="file" name="uploadImage"  onchange="fileChange(this);">
    <input type="submit" value="上传">
</form>
</body>
</html>
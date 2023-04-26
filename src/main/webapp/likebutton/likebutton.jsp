<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<style>
a{
  text-decoration:none; color:inherit; cursor: pointer;
}
 .right_area .icon{
    display: flex;
    align-items: center;
    justify-content: center;
    width: calc(100vw * (45 / 1920));
    height: calc(100vw * (45 / 1920));

    border-radius: 50%;
    border: solid 2px #eaeaea;
    background-color: #fff;
}

.icon.heart img{
    width: calc(100vw * (24 / 1920));
    height: calc(100vw * (24 / 1920));
}

.icon.heart.fas{
  color:red
}
.heart{
    transform-origin: center;
}
.heart.active img{
    animation: animateHeart .3s linear forwards;
}

@keyframes animateHeart{
    0%{transform:scale(.2);}
    40%{transform:scale(1.2);}
    100%{transform:scale(1);}
  }
</style>
<script>

//heart 좋아요 클릭시! 하트 뿅
//heart 좋아요 클릭시! 하트 뿅
$(function(){
    var $likeBtn =$('.icon.heart');

        $likeBtn.click(function(){
        $likeBtn.toggleClass('active');

        if($likeBtn.hasClass('active')){          
           $(this).find('img').attr({
              'src': 'https://cdn-icons-png.flaticon.com/512/803/803087.png',
               alt:'찜하기 완료'
                });
          
          
         }else{
            $(this).find('i').removeClass('fas').addClass('far')
           $(this).find('img').attr({
              'src': 'https://cdn-icons-png.flaticon.com/512/812/812327.png',
              alt:"찜하기"
           })
         }
     })
})

</script>
<body>

<div class="right_area">
  <a href="javascript:;" class="icon heart">
     <img src="https://cdn-icons-png.flaticon.com/512/812/812327.png" alt="찜하기">
  </a>
</div>

</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="resources/stylesheets/main_doctor.css" rel="stylesheet">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<link href="resources/stylesheets/c3.css" rel="stylesheet">
<script src="http://d3js.org/d3.v3.min.js"></script>
<script src="resources/js/c3.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<script>
    $(document).ready(function () {
  $('.leftmenutrigger').on('click', function (e) {
    $('.side-nav').toggleClass("open");
    $('#wrapper').toggleClass("open");
    e.preventDefault();
  });
});
</script>
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
</head>
<body>
  <div id="wrapper" class="animate">
    <nav class="navbar header-top fixed-top navbar-expand-lg navbar-dark bg-dark">
      <a class="navbar-brand" href="http://localhost:8080/main">병원 전산 시스템</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText"
        aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarText">
        <ul class="navbar-nav animate side-nav">
            
          <li class="nav-item">
            <a class="nav-link" href="/register" title="Registor"> <img class="register" src="http://localhost:8080/resources/stylesheets/desk.png" style="width: 38px;"><span class="ttip"> Register</span></a>
            </li>
            <li class="nav-item">
            <a class="nav-link" href="/doctor" title="Doctor"><img class="doctor" src="http://localhost:8080/resources/stylesheets/doctor.png" style="width: 42px;"> <span class="ttip"> Doctor</span></a>
            </li>
          <li class="nav-item">
            <a class="nav-link" href="/hospitalization" title="Hospitalization"> <img class="hospitalization" src="http://localhost:8080/resources/stylesheets/admission.png" style="width: 38px;"><span class="ttip"> Hospitalization</span></a>
          </li>
        </ul>
        <ul class="navbar-nav ml-md-auto d-md-flex">
          <li class="nav-item">
            <a class="nav-link" href="#"><i class="fas fa-key"></i> Logout</a>
          </li>
        </ul>
      </div>
    </nav>
    <div class="container-fluid">
      <div class="row">
        <div class="col">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">나의 정보</h5>
              <h6 class="card-subtitle mb-2 text-muted">님 반갑습니다.</h6>
                <p class="card-text" style="padding-top: 10px;">
                    <table class="table">
                        <tbody>
                          <tr>
                            <td>담당 환자 수</td>
                            <td>명</td>
                          </tr>
                          <tr>
                            <td>근무 시작 시간</td>
                            <td></td>
                          </tr>
                          <tr>
                            <td>근무 완료 시간</td>
                            <td></td>
                          </tr>
                            <tr>
                            <td colspan='2'>
                                <div class="progress">
                                    <div id="progressbar" class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                                        <!-- 근무 완료 시간 - 근무 시작 시간으로 하여 퍼센트 값 삽입-->
                                        <script>
                                            var elem = document.getElementById("progressbar");
                                            var width = 0;
                                            var id = setInterval(frame, 10);
                                            function frame() {
                                                if (width >= 100) {
                                                    clearInterval(id);
                                                } else {
                                                    elem.style.width = width + '%';
                                                }
                                            }
                                        </script>
                                    </div>
                                </div>
                            </td>
                          </tr>
                        </tbody>
                    </table>
                </p>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">생일</h5>
              <h6 class="card-subtitle mb-2 text-muted">월</h6>
              <p class="card-text" style="padding-top: 10px;">
                    <table class="table">
                        <tbody>
                          <tr>
                            <th scope="row">일</th>
                            <td>생일인 사람 이름 의사/간호사</td>
                          </tr>
                          <tr>
                            <th scope="row">일</th>
                            <td>Jacob</td>
                          </tr>
                          <tr>
                            <th scope="row">일</th>
                            <td>Larry</td>
                          </tr>
                        </tbody>
                    </table>
                </p>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">병원 방문 이유</h5>
                <!-- 막대 차트 삽입 -->
                <div id="chart" style="margin-left: 7%;"></div>
                   <script>
                      var chart = c3.generate({
                          size: {
                              width: 500
                          },
                      bindto: '#chart',
                      data: {
                         columns: [
                            ['질병명', 300, 11, 6, 34, 77]
                         ],
                         type: 'bar',
                      },
                      bar: {
                         width: {
                            ratio: 0.4
                         }
                        },
                        axis: {
                         x: {
                            type: 'category',
                            categories: ['한국', '중국', '인도', '일본', '싱가포르']
                         }
                         }
                      });
                   </script>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card">
            <div class="card-body">
                <h5 class="card-title">입원실 현황</h5>
                <!-- 원형 차트 삽입 -->
                <div id="chart2"></div>
                <script>
                      var chart = c3.generate({
                      bindto: '#chart2',
                      data: {
                         columns: [
                            ['사용중인 병상 수', 100],
                                ['사용가능한 병상 수', 80]
                         ],
                         type: 'pie',
                            colors: {
                                '사용중인 병상 수': 'c8d9eb',
                                '사용가능한 병상 수': 'f0d9da'
                            }
                      },
                      });
                   </script>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
  </body>
  </html>
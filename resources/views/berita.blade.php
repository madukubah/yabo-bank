<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="{{asset('front/css/style.css')}}">

    <title>SISA - SISTEM INFROMASI SAMPAH</title>
</head>

<body class="hold-transition sidebar-mini layout-fixed" >
    <div class="wrapper">
        <div class="content-wrapper">
            <div class="row" >
                <div class="col-12" >
                    <img src="<?= asset('uploads/news').'/'.$news->image ?>" class="d-block img-fluid">

                </div>
            </div>
            <div class="row p-2" >
                <div class="col-12" >
                        <h5><b><?= $news->title ?></b></h5>
                </div>
                <div class="col-12" >
                        <?= $news->file_content ?>
                </div>
            </div>
        </div>
    </div>

    <!-- footer -->
    <!-- <section id="footer">
        <div class="container text-center">
            <p>Made With <i class="fa fa-heart-o"></i> by SISA</p>
        </div>
    </section> -->
    <!-- akhir footer -->
    <script src="{{asset('front/js/smooth-scroll.js')}}"></script>
    <script>
        var scroll = new SmoothScroll('a[href*="#"]');
    </script>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>

</html>

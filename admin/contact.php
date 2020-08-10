<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">

<?php
include ('./has/head.php');
?>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <?php
    include ('./has/navbar.php');
    ?>

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <?php
    include ('./has/logout.php');
    ?>


    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <?php
            include ('./has/topbar.php');
            ?>


            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">
                         Contact us</h1>
                </div>

                <div>Dear customer,

                Please note that our customer support centre is working with reduced hours until further notice.

                Note that we are currently experiencing longer wait times than usual and we are working hard to improve the wait time. </div><br><br>

                <!-- Content Row -->
                <div class="row">

                <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center">
                  <h6 class="m-0 font-weight-bold text-primary"></h6>
                        For customer support in Canada
                  </div>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div>Reach out to us by phone:</div>
                    <div>1-844-439-7666 (Employer line)</div>
                    <div>1-844-439-6777 (Administrator line)</div>
                    <div>1-844-439-6767 (User line)</div> <br>

                    <div>Reach out to us by email:</div>
                    <div>employerservice@353jobboardca.com (Employer line)</div>
                    <div>employerservice@353jobboardca.com (Administrator line)</div>
                    <div>employerservice@353jobboardca.com (User line)</div>
                </div>
              </div>
            </div>
            <div class="row">

<div class="col-xl-8 col-lg-7">
<div class="card shadow mb-4">
<!-- Card Header - Dropdown -->
<div class="card-header py-3 d-flex flex-row align-items-center">
  <h6 class="m-0 font-weight-bold text-primary"></h6>
        For customer support in the US
  </div>
</div>
<!-- Card Body -->
<div class="card-body">
    <div>Reach out to us by phone:</div>
    <div>1-800-439-7666 (Employer line)</div>
    <div>1-800-439-6777 (Administrator line)</div>
    <div>1-800-439-6767 (User line)</div> <br>

    <div>Reach out to us by email:</div>
    <div>employerservice@353jobboardus.com (Employer line)</div>
    <div>employerservice@353jobboardus.com (Administrator line)</div>
    <div>employerservice@353jobboardus.com (User line)</div>
</div>
</div>
</div>

        </div>
        <!-- End of Main Content -->


    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->


    <?php
    include ('./has/scripts.php');
    ?>


</body>

</html>

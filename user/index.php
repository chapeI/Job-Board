<?php
session_start();
//echo $_SESSION['employer_bill'];
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
                        <?php
                        echo '<span>'.$_SESSION['employer_name'].'</span>';
                        ?>
                         Dashboard</h1>
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

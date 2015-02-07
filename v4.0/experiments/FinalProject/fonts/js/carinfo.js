var URL = "https://api.edmunds.com/api/vehicle/v2/car?state=selectedstate&year=selectedyear&view=basic&fmt=json&api_key=ea7qsju5c39uqr697b9vjg4x";
var headers = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'POST, GET, OPTIONS, PUT',
    'Content-Type': 'application/json',
    'Accept': 'application/json'
};

function CarInfoController($scope, $http) {
    $http.headers = headers;
    $scope.getDetails = function () {
        //  console.log($scope.selectedyear + "--" + $scope.selectedCar+ "--"+ $scope.state);
        var selectedyear = $scope.selectedyear;
        var car = $scope.selectedCar;
        var state = $scope.state;
        
        if (selectedyear == undefined || car == undefined || state == undefined) {
            alert("Please enter all the fields");
            return false;
        }
        var url = URL.replace("selectedyear", selectedyear);
        url = url.replace("car", car);
        url = url.replace("selectedstate", state);
        console.log(url);
        $http.get(url).success(function (response) {
            var carDetails = response.models;
            $scope.car = carDetails;
            if (carDetails[0] == null) {
                document.getElementById("tab1").style.display = "none";
                document.getElementById("displayMessage").innerHTML = "No Data Available Retry, with another Car.";
            }
            else {
                document.getElementById("tab1").style.display = "";
                document.getElementById("displayMessage").innerHTML = "";
            }

        }).
      error(function (data, status, headers, config) {
          document.getElementById("displayMessage6").innerHTML = "No Data Available Retry, with another Car.";
      });
    }
}
var URL2 = "https://api.edmunds.com/v1/api/vehiclephoto/service/findphotosbystyleid?styleId=carstyle&fmt=json&api_key=ea7qsju5c39uqr697b9vjg4x";


function CarInfoController2($scope, $http) {
    $http.headers = headers;
    $scope.getDetails = function () {
        var carstyle = $scope.carName;
        console.log(carstyle);
        if (carstyle == "") {
            alert("Please select any car name");
            return false;
        }
        var url = URL2.replace("carstyle", carstyle);
        console.log(url);
        $http.get(url).success(function (response) {
            var carImages = response;
            $scope.car2 = carImages;
          //  alert($scope.car2);
            if (carImages[0].photoSrcs[0] == null) {
                document.getElementById("tab2").style.display = "none";
                document.getElementById("displayMessage2").innerHTML = "No Data Available Retry with another Car.";
            }
            else {
                document.getElementById("tab2").style.display = "";
                document.getElementById("displayMessage2").innerHTML = "";
            }

        });
    }
}


var URL3 = "https://api.edmunds.com/v1/api/dealer?zipcode=zipcodeinput&fmt=json&api_key=ea7qsju5c39uqr697b9vjg4x";
var headers = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'POST, GET, OPTIONS, PUT',
    'Content-Type': 'application/json',
    'Accept': 'application/json'
};

function CarInfoController3($scope, $http) {
    $http.headers = headers;
    $scope.getDetails = function () {
        console.log($scope.zipcode);

        var zipcode = $scope.zipcode;

        if (zipcode == "") {
            alert("Please enter zip code to find near by Car dealers");
            return false;
        }
        var url = URL3.replace("zipcodeinput", zipcode);
        console.log(url);
        $http.get(url).success(function (response) {
            var dealerDetails = response.dealerHolder;
            $scope.dealer = dealerDetails;
           // alert(dealerDetails[0].address);
            if (dealerDetails[0] == null) {
                document.getElementById("tab3").style.display = "none";
                document.getElementById("displayMessage3").innerHTML = "No Data Available Retry with another Car.";
            }
            else {
                document.getElementById("tab3").style.display = "";
                document.getElementById("displayMessage3").innerHTML = "";
            }

        });
    }
}

var URL4 = "https://api.edmunds.com/v1/api/tco/newtotalcashpricebystyleidandzip/carstyle/zipcode2?fmt=json&api_key=ea7qsju5c39uqr697b9vjg4x";
var URL5 = "https://api.edmunds.com/v1/api/tco/usedtotalcashpricebystyleidandzip/carstyle/zipcode2?fmt=json&api_key=ea7qsju5c39uqr697b9vjg4x";


function CarInfoController4($scope, $http) {
    $http.headers = headers;
    $scope.getDetails = function () {
        var carstyle = $scope.carName2;
        var zipcode = $scope.zipcode2;
        var caryear = document.getElementById("ddlYear").value;

        console.log(carstyle + "" + zipcode);
        if (carstyle == undefined || zipcode == undefined) {
            alert("Please enter mandatory fields select car name and zipcode :");
            return false;
        }

        if (caryear > 2013) {
            var url = URL4.replace("carstyle", carstyle);
            url = url.replace("zipcode2", zipcode);

        } else {

            var url = URL5.replace("carstyle", carstyle);
            url = url.replace("zipcode2", zipcode);

        }
        console.log(url);
        $http.get(url).success(function (response) {
            var carPrice = response;
            $scope.car = carPrice;
           // alert($scope.car.value);
            if ($scope.car.value == null) {
                document.getElementById("tab4").style.display = "none";
                document.getElementById("displayMessage4").innerHTML = "No Data Available Retry with another Car.";
            }
            else {
                document.getElementById("tab4").style.display = "";
                document.getElementById("displayMessage4").innerHTML = "";
            }

        });
    }
}
var URL6 = "https://api.edmunds.com/api/vehicle/v2/styles/carstyle/equipment?&fmt=json&api_key=ea7qsju5c39uqr697b9vjg4x";
var URL7 = "https://api.edmunds.com/api/vehicle/v2/styles/carstyle/equipment?equipmentType=carequipment&fmt=json&api_key=ea7qsju5c39uqr697b9vjg4x";

function CarInfoController5($scope, $http) {
    $http.headers = headers;
    $scope.getDetails = function () {
        var carstyle = $scope.carName;
        var equipmenttype = $scope.equipmentType;
        console.log(carstyle + "" + equipmenttype);
        if (carstyle == undefined || equipmenttype == undefined) {
            alert("Please mandatory fields car name and equipment type");
            return false;
        }
        if (equipmenttype == "All") {
            var url = URL6.replace("carstyle", carstyle);
            console.log(url);
        } else {
            var url = URL7.replace("carstyle", carstyle);
            url = url.replace("carequipment", equipmenttype);
            console.log(url);
        }
        $http.get(url).success(function (response) {
            var carequipmentdetails = response;
            $scope.carequipment = carequipmentdetails.equipment;
            console.log("carequipmentdetails " + carequipmentdetails.equipmentCount);
            if (carequipmentdetails.equipmentCount == 0) {
                document.getElementById("tab5").style.display = "none";
                document.getElementById("displayMessage5").innerHTML = "No Data Available Retry with another Selection.";
            }
            else {
                document.getElementById("tab5").style.display = "";
                document.getElementById("displayMessage5").innerHTML = "";
            }

        });
    }
}
var URL8 = "https://api.edmunds.com/api/vehiclereviews/v2/styles/carstyle?sortby=created%3ADESC&pagenum=1&pagesize=5&fmt=json&api_key=ea7qsju5c39uqr697b9vjg4x";


function CarInfoController6($scope, $http) {
    $http.headers = headers;
    $scope.getDetails = function () {
        var carstyle = $scope.carName;

        console.log(carstyle);
        if (carstyle == undefined) {
            alert("Please mandatory fields car name ");
            return false;
        }

        var url = URL8.replace("carstyle", carstyle);

        console.log(url);


        $http.get(url).success(function (response) {
            var carreviewdetails = response;

            if (carreviewdetails.status == "NOT_FOUND") {
                document.getElementById("displayMessage6").innerHTML = "No Review Available Retry with another Car.";
            } else {
                $scope.carreview = carreviewdetails.reviews;
                console.log("carreviewdetails " + carreviewdetails.reviewsCount);

                if (carreviewdetails.reviewsCount == 0) {

                    document.getElementById("displayMessage6").innerHTML = "No Review Available Retry with another Car.";
                }
                else {

                    document.getElementById("displayMessage6").innerHTML = "";
                }
            }

        }).
      error(function (data, status, headers, config) {
          document.getElementById("displayMessage6").innerHTML = "No Review Available Retry with another An Old Car.";
      });
    }
}

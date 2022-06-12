'use strict'

var module = angular.module("EAnim", ["ngAnimate", "ngMaterial"]);

module.controller("Controller", Controller);

/**
 * 
 * @param {angular.IScope} $scope
 * @param {angular.IHttpService} $http
 */
function Controller($scope, $http, $mdDialog)
{
    this.Init = function ()
    {
        $scope.Template = "Prestations";
        $scope.Prestations = [];

        $http.get("/api/Prestation").then(
            /**
             * 
             * @param {angular.IHttpResponse<Responce<Array<ProtoPrestation>>>} datas
             */
            function (datas)
            {
                if (datas.data.IsSuccess)
                {
                    $scope.Prestations = datas.data.Datas;
                    //$scope.Prestations.unshift({});
                }
                else
                    alert(datas.data.Messages.join("\r\n"));
            }
        )
    }

    /**
     * 
     * @param {ProtoPrestation} prestation
     */
    $scope.GetPrestationColor = function (prestation)
    {
        if ((prestation.Etat & E_PrestationEtat.ANNULE) != 0) // Préstation Annuler
            return "bg-danger";
        if ((prestation.Etat & E_PrestationEtat.PRESTATION_PAYE) != 0) // Préstation terminer et payée
            return "bg-success";
        if ((prestation.Etat & 0x3F) != 0x3F && prestation.HoraireFin < new Date()) // Préstation prête. En attente du jour J.
            return "bg-info";

        // Préstation incomplète ou non-payée.
        return "bg-warning";
    }

    /**
     *
     * @param {ProtoPrestation} prestation
     */
    $scope.EditPrestation = function (prestation)
    {
        $mdDialog.show({
            controller: function ($scope, $mdDialog)
            {
                $scope.hide = function ()
                {
                    $mdDialog.hide();
                };

                $scope.cancel = function ()
                {
                    $mdDialog.cancel();
                };

                $scope.answer = function (answer)
                {
                    $mdDialog.hide(answer);
                };

                $scope.SearchPrestationTypes = (search) => $scope.PrestationTypes?.filter(type => type.Nom.toLowerCase().includes(search.toLowerCase()));
                $scope.AddPrestationType = function (searchText)
                {
                    $http.get(`/api/PrestationType/${searchText}`).then(
                        function (datas)
                        {
                            $scope.PrestationType = datas.data.Datas;
                        }
                    );
                }

                $scope.SearchLieux = (search) => $scope.Lieux?.filter(lieu => lieu.Nom.toLowerCase().includes(search.toLowerCase()));
                $scope.AddLieu = function (searchText)
                {
                    $mdDialog.show({
                        controller: function ($scope, $mdDialog)
                        {
                            $scope.Lieu = { Nom: searchText };

                            $scope.hide = function ()
                            {
                                $mdDialog.hide();
                            };

                            $scope.cancel = function ()
                            {
                                $mdDialog.cancel();
                            };

                            $scope.answer = function (answer)
                            {
                                if (LieuForm.checkValidity())
                                {
                                    $scope.LoadingSave = true;
                                    $http.post(`/api/Lieu/`, answer).then(
                                        function (datas)
                                        {
                                            if (datas.data.IsSuccess)
                                                $mdDialog.hide(datas.data.Datas);
                                            else
                                                alert(datas.data.Messages.join("\r\n"));
                                        }
                                    );
                                }
                                else
                                {
                                    EditLieuDialog.classList.add("shake");
                                    setTimeout(() => EditLieuDialog.classList.remove("shake"), 1000);
                                }
                            };
                        },
                        templateUrl: '/Templates/Dialogs/EditLieu.html',
                        parent: angular.element(document.body),
                        clickOutsideToClose: true,
                        fullscreen: true,
                        multiple: true
                    }).then(function (answer)
                    {
                        $scope.Lieu = answer;
                    }).catch(function ()
                    {
                        $scope.Lieu = null;
                        $scope.SearchLieu = null;
                    });
                }

                $http.get("/api/PrestationTypes").then(
                    function (datas)
                    {
                        $scope.PrestationTypes = datas.data.Datas;
                    }
                );
                $http.get("/api/Lieu").then(
                    function (datas)
                    {
                        $scope.Lieux = datas.data.Datas;
                    }
                );
            },
            templateUrl: '/Templates/Dialogs/EditPrestation.html',
            parent: angular.element(document.body),
            clickOutsideToClose: true,
            fullscreen: true, // Only for -xs, -sm breakpoints.
            multiple: true
        }).then(function (answer)
        {
            $scope.status = 'You said the information was "' + answer + '".';
        });
    }
}
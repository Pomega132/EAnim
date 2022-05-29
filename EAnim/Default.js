'use strict'

var module = angular.module("EAnim", ['ngMaterial']);

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
            },
            templateUrl: '/Templates/Dialogs/EditPrestation.html',
            parent: angular.element(document.body),
            clickOutsideToClose: true,
            fullscreen: $scope.customFullscreen // Only for -xs, -sm breakpoints.
        }).then(function (answer)
        {
            $scope.status = 'You said the information was "' + answer + '".';
        });
    }
}
/*-------------- 10 line chart amchart end ------------*/

/*-------------- 11 line chart amchart start ------------*/
if ($('#salesanalytic').length) {

    var chart = AmCharts.makeChart("salesanalytic", {
        "type": "serial",
        "theme": "light",
        "dataDateFormat": "YYYY-MM-DD",
        "precision": 2,
        "valueAxes": [{
            "id": "v1",
            "title": "Sales",
            "position": "left",
            "autoGridCount": false,
            "labelFunction": function(value) {
                return "$" + Math.round(value) + "M";
            }
        }, {
            "id": "v2",
            "title": "Duration",
            "gridAlpha": 0,
            "position": "right",
            "autoGridCount": false
        }],
        "graphs": [{
            "id": "g3",
            "valueAxis": "v1",
            "lineColor": "#F3F8FB",
            "fillColors": "#F3F8FB",
            "fillAlphas": 1,
            "type": "column",
            "title": "Actual Sales",
            "valueField": "sales2",
            "clustered": false,
            "columnWidth": 0.5,
            "legendValueText": "$[[value]]M",
            "balloonText": "[[title]]<br /><small style='font-size: 130%'>$[[value]]M</small>"
        }, {
            "id": "g4",
            "valueAxis": "v1",
            "lineColor": "#5C6DF4",
            "fillColors": "#5C6DF4",
            "fillAlphas": 1,
            "type": "column",
            "title": "Target Sales",
            "valueField": "sales1",
            "clustered": false,
            "columnWidth": 0.3,
            "legendValueText": "$[[value]]M",
            "balloonText": "[[title]]<br /><small style='font-size: 130%'>$[[value]]M</small>"
        }, {
            "id": "g1",
            "valueAxis": "v2",
            "bullet": "round",
            "bulletBorderAlpha": 1,
            "bulletColor": "#FFFFFF",
            "bulletSize": 5,
            "hideBulletsCount": 50,
            "lineThickness": 2,
            "lineColor": "#815FF6",
            "type": "smoothedLine",
            "title": "Duration",
            "useLineColorForBulletBorder": true,
            "valueField": "market1",
            "balloonText": "[[title]]<br /><small style='font-size: 130%'>[[value]]</small>"
        }, {
            "id": "g2",
            "valueAxis": "v2",
            "bullet": "round",
            "bulletBorderAlpha": 1,
            "bulletColor": "#FFFFFF",
            "bulletSize": 5,
            "hideBulletsCount": 50,
            "lineThickness": 2,
            "lineColor": "#ffe598",
            "type": "smoothedLine",
            "dashLength": 5,
            "title": "Market Days ALL",
            "useLineColorForBulletBorder": true,
            "valueField": "market2",
            "balloonText": "[[title]]<br /><small style='font-size: 130%'>[[value]]</small>"
        }],
        "chartScrollbar": {
            "graph": "g1",
            "oppositeAxis": false,
            "offset": 50,
            "scrollbarHeight": 45,
            "backgroundAlpha": 0,
            "selectedBackgroundAlpha": 0.5,
            "selectedBackgroundColor": "#f9f9f9",
            "graphFillAlpha": 0.1,
            "graphLineAlpha": 0.4,
            "selectedGraphFillAlpha": 0,
            "selectedGraphLineAlpha": 1,
            "autoGridCount": true,
            "color": "#95a1f9"
        },
        "chartCursor": {
            "pan": true,
            "valueLineEnabled": true,
            "valueLineBalloonEnabled": true,
            "cursorAlpha": 0,
            "valueLineAlpha": 0.2
        },
        "categoryField": "date",
        "categoryAxis": {
            "parseDates": true,
            "dashLength": 1,
            "minorGridEnabled": true,
            "color": "#5C6DF4"
        },
        "legend": {
            "useGraphSettings": true,
            "position": "top"
        },
        "balloon": {
            "borderThickness": 1,
            "shadowAlpha": 0
        },
        "export": {
            "enabled": false
        },
        "dataProvider": [{
            "date": "2013-01-16",
            "market1": 51,
            "market2": 55,
            "sales1": 5,
            "sales2": 8
        }, {
            "date": "2014-01-17",
            "market1": 64,
            "market2": 70,
            "sales1": 5,
            "sales2": 6
        }, {
            "date": "2014-01-18",
            "market1": 65,
            "market2": 45,
            "sales1": 8,
            "sales2": 12
        }, {
            "date": "2013-01-19",
            "market1": 73,
            "market2": 75,
            "sales1": 7,
            "sales2": 8
        }, {
            "date": "2013-01-20",
            "market1": 65,
            "market2": 70,
            "sales1": 7,
            "sales2": 10
        }, {
            "date": "2013-01-21",
            "market1": 65,
            "market2": 55,
            "sales1": 9,
            "sales2": 12
        }, {
            "date": "2013-01-22",
            "market1": 68,
            "market2": 62,
            "sales1": 5,
            "sales2": 7
        }, {
            "date": "2013-01-23",
            "market1": 75,
            "market2": 80,
            "sales1": 7,
            "sales2": 10
        }, {
            "date": "2013-01-24",
            "market1": 75,
            "market2": 65,
            "sales1": 7,
            "sales2": 9
        }, {
            "date": "2013-01-25",
            "market1": 75,
            "market2": 69,
            "sales1": 8,
            "sales2": 10
        }, {
            "date": "2013-01-26",
            "market1": 55,
            "market2": 68,
            "sales1": 6,
            "sales2": 7
        }, {
            "date": "2013-01-27",
            "market1": 67,
            "market2": 70,
            "sales1": 3,
            "sales2": 4
        }, {
            "date": "2013-01-28",
            "market1": 62,
            "market2": 59,
            "sales1": 5,
            "sales2": 7
        }, {
            "date": "2013-01-29",
            "market1": 62,
            "market2": 56,
            "sales1": 5,
            "sales2": 8
        }, {
            "date": "2013-01-30",
            "market1": 71,
            "market2": 69,
            "sales1": 4,
            "sales2": 7
        }]
    });
}
//------------echarts2

/*-------------- 11 line chart amchart end ------------*/
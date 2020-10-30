<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="presentationWeb.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main_content_wrapper" runat="server">
        <div class="container-fluid">

        <!-- breadcrumb -->
        <div class="row">
            
            <div class="col-lg-12">
                <ol class="breadcrumb" style="background-color: #E5E6EB;">
                    <li>
                        <i class="fa fa-dashboard"></i>&nbsp Dashboard

                    </li>
                </ol>
            </div>
        </div>

        <!-- titel -->
        <div class="row">
            <div class="col-lg-12 col-xs-12">
                <h4>Dashboard</h4>
                <div class="col-sm-10 col-xs-12" style="padding: 0px;">
                </div>
            </div>
        </div>


        <!-- VOOR EEN ADMIN -->
        <div runat="server" id="div_admin">

            <div class="row">
                <div class="col-lg-2 col-md-2">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comments fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div style="font-size: 20px;">
                                        <asp:Label ID="lblTotaalTickets" runat="server" Text="Label"></asp:Label>
                                    </div>
                                    <div>Aantal tickets</div>
                                </div>
                            </div>
                        </div>
                        <a href="ticket-beheer.aspx">
                            <div class="panel-footer">
                                <span class="pull-left">Bekijk ze</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div style="font-size: 20px;">
                                        <asp:Label ID="lblOpenTickets" runat="server" Text=""></asp:Label>
                                    </div>
                                    <div>Aantal open</div>
                                </div>
                            </div>
                        </div>
                        <a href="ticket-beheer.aspx">
                            <div class="panel-footer">
                                <span class="pull-left">Bekijk ze</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-ticket fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div style="font-size: 20px;">
                                        <asp:Label ID="lblonbekendTickets" runat="server" Text="Label"></asp:Label>
                                    </div>
                                    <div>Aantal onbekend</div>
                                </div>
                            </div>
                        </div>
                        <a href="ticket-beheer.aspx">
                            <div class="panel-footer">
                                <span class="pull-left">Bekijk ze</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-support fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div style="font-size: 20px;">
                                        <asp:Label ID="lblGeslotenTickets" runat="server" Text="Label"></asp:Label>
                                    </div>
                                    <div>Aantal gesloten</div>
                                </div>
                            </div>
                        </div>
                        <a href="ticket-beheer.aspx">
                            <div class="panel-footer">
                                <span class="pull-left">Bekijk ze</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4">
                    <div class="panel" style="background-color: rebeccapurple !important; color: white!important;">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-user fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div style="font-size: 20px;">
                                        <asp:Label ID="lblgebruikersonline" runat="server" Text="Label"></asp:Label>
                                    </div>
                                    <div>Aantal online gebruikers</div>
                                </div>
                            </div>
                        </div>
                        <a href="gebruiker-beheer.aspx" onclick="">
                            <div class="panel-footer" style="color: rebeccapurple !important;">
                                <span class="pull-left">Bekijk ze</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <!-- rij met gekleurede panels -->

            <div class="row">
                <div class="col-lg-7">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i>&nbsp;Ticketten chart
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="morris-area-chart">
                                <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
                                <script>
                                    google.charts.load('current', { 'packages': ['bar'] });
                                    google.charts.setOnLoadCallback(drawStuff);

                                    function drawStuff() {
                                        var data = new google.visualization.arrayToDataTable([
                                            ['Soort', 'Percentage'],
                                            ["Open tickets", (document.getElementById('<%=lblOpenTickets.ClientID%>').innerHTML / document.getElementById('<%=lblTotaalTickets.ClientID%>').innerHTML * 100)],
                                        ["Gesloten tickets", (document.getElementById('<%=lblGeslotenTickets.ClientID%>').innerHTML / document.getElementById('<%=lblTotaalTickets.ClientID%>').innerHTML * 100)],
                                        ["Onbekende tickets", (document.getElementById('<%=lblonbekendTickets.ClientID%>').innerHTML / document.getElementById('<%=lblTotaalTickets.ClientID%>').innerHTML * 100)]
                                        ]);

                                        var options = {
                                            width: 800,
                                            legend: { position: 'none' },
                                            bar: { groupWidth: "50%" },
                                        };

                                        var chart = new google.charts.Bar(document.getElementById('top_x_div'));
                                        // Convert the Classic options to Material options.
                                        chart.draw(data, google.charts.Bar.convertOptions(options));
                                    };
                                </script>
                                <div id="top_x_div" style="width: 800px; height: 400px;"></div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                </div>


                <div class="col-lg-3">
                    <div class="panel panel-default">
                        <div class="panel-heading"><i class="fa fa-heartbeat fa-fw"></i>&nbsp;Status van de website</div>
                        <div class="panel-body" style="height: 150px;">

                            <style>
                                .progress {
                                    height: 1.5rem;
                                    overflow: hidden;
                                    background-color: grey;
                                    border-radius: .25rem;
                                }

                                .progress-bar {
                                    display: inline-block;
                                    height: 100%;
                                }

                                .bg-weak {
                                    background-color: #d9534f;
                                }

                                .bg-good {
                                    background-color: #f0ad4e !important;
                                }

                                .bg-strong {
                                    background-color: #5cb85c !important;
                                }
                            </style>

                            <div id="progress" class="progress">
                                <div class="progress-bar bg-weak" style="width: 33.33%"></div>
                                <div class="progress-bar bg-good" style="width: 33.33%"></div>
                                <div class="progress-bar bg-strong" style="width: 33.33%"></div>
                            </div>
                            <asp:BulletedList ID="listTaken" runat="server"></asp:BulletedList>
                            <script>
                                const [...barEls] = document.querySelectorAll(`.progress > .progress-bar`);// collection to array

                                function updateProgress(e) {
                                    let value = e.target.value;
                                    const maxVals = [33.33, 33.33, 33.33];// max width values of elements

                                    for (let i = 0; i < barEls.length; i++) {
                                        if (value > maxVals[i]) {
                                            updateElWidth(barEls[i], maxVals[i]);
                                            value -= maxVals[i];
                                        } else {
                                            updateElWidth(barEls[i], value);
                                            barEls.slice(i + 1).forEach(bar => updateElWidth(bar, 0));// nullify rest bars
                                            break;
                                        }
                                    }

                                    function updateElWidth(el, width) {
                                        el.style.width = `${width}%`;
                                    }
                                }
                            </script>

                        </div>
                    </div>
                </div>
                                            <asp:Label Text="" style="visibility:hidden" ID="lblAantalgebruikers" runat="server" />
                            <asp:Label Text="" style="visibility:hidden" ID="lblAantalAdmins" runat="server" />
                <div class="col-lg-3">
                    <div class="panel panel-default">
                        <div class="panel-heading"><i class="fa fa-user fa-fw"></i>&nbsp;Gebruikers chart</div>
                        <div class="panel-body">

                            <script>
                                google.charts.load('current', { 'packages': ['corechart'] });
                                google.charts.setOnLoadCallback(drawChart);

                                function drawChart() {

                                    var data = google.visualization.arrayToDataTable([
                                        ['Groep', 'Aantal', { role:'tooltip'}],
                                        ['Admin', (document.getElementById('<%=lblAantalAdmins.ClientID%>').innerHTML / (document.getElementById('<%=lblAantalAdmins.ClientID%>').innerHTML + document.getElementById('<%=lblAantalgebruikers.ClientID%>').innerHTML)) * 100,'Aantal admins: ' + document.getElementById('<%=lblAantalAdmins.ClientID%>').innerHTML],
                                        ['Gebruiker', (document.getElementById('<%=lblAantalgebruikers.ClientID%>').innerHTML / (document.getElementById('<%=lblAantalAdmins.ClientID%>').innerHTML + document.getElementById('<%=lblAantalgebruikers.ClientID%>').innerHTML)) * 100,'Aantal gebruikers: ' + document.getElementById('<%=lblAantalgebruikers.ClientID%>').innerHTML]
                                    ]);

                                    var options = {
                                        'legend': 'right',
                                        'is3D': 'false',
                                        'width': 350,
                                        'height': 185,
                                         tooltip: { trigger: 'selection' }
                                    };

                                    var chart = new google.visualization.PieChart(document.getElementById('piechart'));

                                    chart.draw(data, options);
                                }
                            </script>
                            <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
                            <div id="piechart" style="width: 365px; height: 185px;"></div>
                        </div>
                    </div>
                </div>

            </div>

        </div>


        <!-- VOOR EEN GEWONE GEBRUIKER -->
        <div runat="server" id="div_gebruiker" visible="false">
            <div class="row">
                <div class="col-lg-2 col-md-2">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comments fa-3x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div style="font-size: 20px;">
                                        <asp:Label ID="lblTicketsGebruiker" runat="server" Text="Label"></asp:Label>
                                    </div>
                                    <div>Aantal tickets</div>
                                </div>
                            </div>
                        </div>
                        <a href="ticket-beheer.aspx">
                            <div class="panel-footer">
                                <span class="pull-left">Bekijk ze</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <!-- rij met gekleurede panels -->
        </div>

        </div> <!-- container fluid close -->

        <!-- script google analytics -->
        <div>
            <!-- Global site tag (gtag.js) - Google Analytics -->
            <script async src="https://www.googletagmanager.com/gtag/js?id=UA-135457731-3"></script>
            <script>
                window.dataLayer = window.dataLayer || [];
                function gtag() { dataLayer.push(arguments); }
                gtag('js', new Date());

                gtag('config', 'UA-135457731-3');
            </script>
        </div>
        

</asp:Content>

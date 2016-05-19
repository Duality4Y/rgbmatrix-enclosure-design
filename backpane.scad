//difference()
//{
//    square([100, 200]);
//    square([10, 20]);
//}

width = 190;
height = 95;

hole_width = 172;
hole_height = 75;

iwidth = 13.9;
iheight = 13.9;
sopeny = 21.5;

module edge_pane()
{
    difference()
    {
        square([width, height]);
        translate([iwidth, iheight])
        square([width - (iwidth * 2), height - (iheight * 2)]);
        translate([0, sopeny])
        square([iwidth, iwidth]);
    }
}

module pane()
{
    square([width, height]);
}

module hole(d=3)
{
    circle(d=d, $fn=100);
}

module holes(width, height, d)
{
    hole();
    translate([width / 2, 0])
    hole();
    translate([width, 0])
    hole();
    
    translate([0, height])
    hole();
    translate([width / 2 , height])
    hole();
    translate([width, height])
    hole();
}

//difference()
//{
//    pane();
//    edge_pane();
//    translate([10, 10])
//    holes(hole_width, hole_height, 3);
//}

module backpane()
{
    difference()
    {
        pane();
        translate([10, 10])
        holes(hole_width, hole_height, 3);
    }
}

module openpane()
{
    difference()
    {
        edge_pane();
        translate([10, 10])
        holes(hole_width, hole_height, 3);
    }
}

//backpane();
openpane();
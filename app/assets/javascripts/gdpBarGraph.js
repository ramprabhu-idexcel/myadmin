// define margin
var margin = { top: 20, right: 10, bottom: 100, left: 40 },
    width = 500 - margin.right - margin.left,
    height = 300 - margin.top - margin.bottom;

// define SVG

var svg = d3.select(".bar_graph_panel")
    .append("svg")
    .attr({
       "width": width + margin.right + margin.left,
        "height": height + margin.top + margin.bottom
    })
    .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.right + ")");

// define scale on axis

// define the x & y scale

var xScale = d3.scale.ordinal().rangeRoundBands([0, width], 0.2 , 0.2);

var yScale = d3.scale.linear().range([height, 0]);

// define axis

var xAxis = d3.svg.axis()
    .scale(xScale)
    .orient("bottom");

var yAxis = d3.svg.axis()
    .scale(yScale)
    .orient("left");

// Import the data

function render(data){

    data.forEach(function(d){
        d.gdp = +d.gdp;
        d.country = d.country;
        console.log(d.gdp);
    });

    data.sort(function(a,b){
        return b.gdp - a.gdp;
    });

    // specify the domains of x & y scales
    xScale.domain(data.map(function(d) { return d.country; }));
    yScale.domain([0, d3.max(data, function(d) { return d.gdp; })]);

    //draw the bars
    svg.selectAll("rect")
        .data(data)
        .enter()
        .append("rect")
        .attr("height",0)
        .transition()
        .duration(3000).delay(function(d,i) { return i * 200; })
        .attr("y", height)
        .attr({
            "x": function(d) { return xScale(d.country) },
            "y": function(d) { return yScale(d.gdp) },
            "width": xScale.rangeBand(),
            "height": function(d) { return height - yScale(d.gdp) }
        })
        .style("fill", function(d,i) { return 'rgb(231, 42, 65)'});

    // label the bars
    svg.selectAll("text")
        .data(data)
        .enter()
        .append('text')
        .text(function(d) { return d.gdp; })
        .attr("x", function(d){ return xScale(d.country) + xScale.rangeBand()/2; })
        .attr("y", function(d){ return yScale(d.gdp) + 12; })
        .style("fill", "white")
        .style("text-anchor", "middle");



    //draw the x axis
    svg.append("g")
        .attr("class", "x axis")
        .attr("transform", "translate(0,"+ height + ")")
        .call(xAxis)
        .selectAll("text")
        .attr("transform", "rotate(-60)")
        .attr("dx", "-.8em")
        .attr("dy", ".25em")
        .style("text-anchor", "end")// will pull the label text out
        .style("font-size", "12px");

    //draw the y axis
    svg.append("g")
        .attr("class", "y axis")
        .call(yAxis)
        .style("font-size","12px");

}

var myArrayOfObjects = [
    { country: 'Brazil', gdp: 2.14 },
    { country: 'Italy', gdp: 2.04 },
    { country: 'India', gdp: 1.7 },
    { country: 'Canada', gdp: 1.57 },
    { country: 'Russian Federation', gdp: 1.52 },
    { country: 'spain', gdp: 1.37 },
    { country: 'Australia', gdp: 1.14 },
    { country: 'Mexico', gdp: 1.04 },
    { country: 'Korea', gdp: 1.01 },
    { country: 'United states', gdp: 14.9 },
    { country: 'China', gdp: 5.93 },
    { country: 'Germony', gdp: 3.28 },
    { country: 'Japan', gdp: 5.49 },
    { country: 'France', gdp: 2.54 },
    { country: 'United Kingtom', gdp: 2.28 }

];
render(myArrayOfObjects);






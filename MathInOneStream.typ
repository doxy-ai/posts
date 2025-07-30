#import "@preview/cetz:0.4.0"
#import "@preview/cetz-plot:0.1.2": plot, chart
#import "@preview/plotsy-3d:0.2.0": plot-3d-vector-field

#let html_available = true

#let maybe_html_frame(content) = if html_available {
  html.frame(content)
} else {
  content
}

#let frame(content) = if html_available {
  html.elem("pre", attrs: (
    style: "color:#f8f8f2;background-color:#272822;",
    class: "markdown-body"
  ))[#html.frame(content)]
} else {
  set text(fill: rgb("#f8f8f2"))
  let r = 3pt
  align(center, box(
    fill: rgb("#272822"),
    outset: (y: r),
    inset: (x: r),
    radius: r,
    content
  ))
}
#let text-color = rgb("#c9d1d9")

#set text(fill: text-color)

Let's begin by talking about space. When we refer to space here, we're not talking about the vast expanse beyond our planet—the stars, the moon, or asteroids. Instead, we're discussing space in a mathematical or geometric sense.

At its simplest, space can be represented as a line. When we have just one line, we typically call it the x-axis. When we introduce a second line, we usually label the horizontal one as the x-axis, and the vertical one as the y-axis. Together, these two lines form a plane.

#let plot_line_color_setup() = cetz.draw.set-style(axes: (stroke: text-color, tick: (stroke: text-color)))

#frame(cetz.canvas({
  plot_line_color_setup()
  plot.plot(size: (8, 8),
    x-tick-step: 1, x-min: 0, x-max: 10,
    y-tick-step: 1, y-min: 10, y-max: 0,
    x-grid: true,
    y-grid: true,
    legend: none,
    {
      let domain = (-1.1 * calc.pi, +1.1 * calc.pi)

      plot.add(((0, 0), (.01, 1)), style: (stroke: text-color))
    })
}))

When we add a third line, we enter the realm of 3D space, which begins to resemble the three-dimensional world we live in—something like a cube or a box. This third axis is called the z-axis.

#let size = 10
#let scale-factor = 0.12
#let (xscale,yscale,zscale) = (0.3,0.3,0.3)
#let i-func(x,y,z) = x + 0
#let j-func(x,y,z) = y + 0
#let k-func(x,y,z) = z + .01
#let color-func(x, y, z, x-lo,x-hi,y-lo,y-hi,z-lo,z-hi) = {
  return color.rgb(0, 0, 0, 0)
}

#frame(plot-3d-vector-field(
    i-func,
    j-func,
    k-func,
    color-func: color-func,
    subdivisions: 10,
    subdivision-mode: "decrease",
    scale-dim: (xscale*scale-factor,yscale*scale-factor, zscale*scale-factor),
    xdomain: (-size,size),
    ydomain:  (-size,size),
    zdomain: (0,size),
    // pad-high: (0,0,2),
    rotation-matrix: ((-1.5, 1.2, 4), (0, -1, 0)),
    axis-labels: ($x$, $z$, $y$),
    axis-label-offset: (0.4,0.2,0.2),
    axis-text-offset: 0.08,
    vector-size: 0.1em,
    xyz-colors: (red,green,blue),
))

But space doesn't stop at three dimensions. There are higher-dimensional spaces as well, like 4D or 5D space. However, human brains aren't naturally equipped to visualize these higher dimensions.

In summary, the key axes in the spaces we most commonly deal with are:
- x-axis (horizontal)
- y-axis (vertical)
- z-axis (depth, in 3D space)
- and sometimes a w-axis, which appears in 4D and beyond.

Why the sequence goes x, y, z, and then w isn't entirely clear—it might seem more intuitive for the w-axis to appear at the front or elsewhere. But this naming convention could be related to a topic we'll explore in a future session: quaternions.

Before we move on, here's a quick note for math enthusiasts: you might notice that in this example, the y-axis increases downward—this is actually the opposite of how it's usually represented in mathematics, where the y-axis points up. This downward orientation is a legacy from the way old computer monitors were designed.

Back in the CRT (Cathode Ray Tube) monitor days, an electron beam would scan from the top-left of the screen across to the top-right, then move down one row and repeat. Because of this, in computer graphics, we usually treat the top-left corner as the origin point (0, 0). From there, the x-axis increases to the right and the y-axis increases downward. This convention has stuck around mostly out of tradition, even though it's no longer technically necessary.

= Vectors in Space

Let's talk about vectors in space.

We can start by creating a simple vector. A vector has a few key characteristics: it has a direction and a length. We can describe a vector numerically by measuring how far it goes along each axis.

For example, let's say we have a vector that moves 2 units along the x-axis and 2 units along the y-axis. We represent this vector as (2, 2).

#let draw_full_vector(start, end, color) = cetz.draw.line(start, end, mark: (end: "straight", scale: 2), stroke: color)
#let draw_vector(end, color, start: "plot.origin") = draw_full_vector("plot.origin", end, color)

#frame(cetz.canvas({
  // import cetz.draw: *
  plot_line_color_setup()
  plot.plot(size: (4, 4), name: "plot",
    x-tick-step: 1, x-min: 0, x-max: 4,
    y-tick-step: 1, y-min: 4, y-max: 0,
    x-grid: true,
    y-grid: true,
    legend: none,
    {
      plot.add(((0, 0), (.01, .01)), style: (stroke: text-color))

      plot.add-anchor("origin", (0, 0))
      plot.add-anchor("end", (2, 2))
    })

    draw_vector("plot.end", blue)
}))

Now, consider a different vector that also moves 2 units along the x-axis, but it goes down by 4 units. We would represent that vector as (2, 4). This shows how vectors can differ even if they share one coordinate.

#frame(cetz.canvas({
  // import cetz.draw: *
  plot_line_color_setup()
  plot.plot(size: (4, 4), name: "plot",
    x-tick-step: 1, x-min: 0, x-max: 4,
    y-tick-step: 1, y-min: 4, y-max: 0,
    x-grid: true,
    y-grid: true,
    legend: none,
    {
      plot.add(((0, 0), (.01, .01)), style: (stroke: text-color))

      plot.add-anchor("origin", (0, 0))
      plot.add-anchor("a", (2, 2))
      plot.add-anchor("b", (2, 4))
    })

  draw_vector("plot.a", blue)
  draw_vector("plot.b", red)
}))

=== Measuring the Length of a Vector

We mentioned that vectors have both direction and length. Let's explore length, also called the magnitude of a vector. Returning to our earlier example, the vector (2, 2) — how long is it?

We use double bars to denote the magnitude:
||(2, 2)||

To find the length, we use the Pythagorean theorem:

#frame[$sqrt(x^2 + y^2 + z^2 + w^2 + ...)$]

In this case:

#frame[$sqrt(x^2 + y^2) = sqrt(2^2 + 2^2) = sqrt(4 + 4) = sqrt(8) approx 2.82$]

So, the diagonal vector (2, 2) has a length greater than 2, which makes sense — diagonals are longer than the sides that define them.

=== Scaling Vectors

What else can we do with a vector like (2, 2)? We can scale it by multiplying it by a number. For instance, if we multiply (2, 2) by 2, we multiply each component by 2:

#frame[$2 * (2, 2) = (2 * 2, 2 * 2) = (4, 4)$]

This new vector, (4, 4), points in the same direction but is twice as long. It's like a stretched version of our original vector.

#frame(cetz.canvas({
  // import cetz.draw: *
  plot_line_color_setup()
  plot.plot(size: (4, 4), name: "plot",
    x-tick-step: 1, x-min: 0, x-max: 4,
    y-tick-step: 1, y-min: 4, y-max: 0,
    x-grid: true,
    y-grid: true,
    legend: none,
    {
      plot.add(((0, 0), (.01, .01)), style: (stroke: text-color))

      plot.add-anchor("origin", (0, 0))
      plot.add-anchor("a", (2, 2))
      plot.add-anchor("b", (4, 4))
    })

  draw_vector("plot.b", red)
  draw_vector("plot.a", blue)
}))

== Normalizing Vectors

We looked at multiplying a vector like (2, 2) by a number, such as 2. But what happens if, instead, we divide the vector by its own length?

We start with the vector (2, 2). Its length, as we've already calculated, is `sqrt(8)`. So what happens if we divide each component of the vector by `sqrt(8)`?

Doing this gives us a new vector:

#frame[$(2, 2) \/ sqrt(8) = (2 / sqrt(8), 2 / sqrt(8)) approx (.7, .7)$]

This new vector (.7, .7) has a very important and interesting property: its length is exactly 1.

Vectors like this are called:
- Unit vectors
- Direction vectors
- Or normal vectors (in certain contexts)

They're special because they only describe direction, not magnitude. That's why they're so useful. If you take a unit vector and multiply it by any number, you get a new vector that points in the same direction, but has the length of that number. This is why they're often referred to as direction vectors—they represent pure direction.

You'll also hear about unit vectors when we talk about normals—which are vectors that are perpendicular to a surface; which are usually also unit vectors to keep things consistent and mathematically clean.

== Vector Addition

What happens when we have more than one vector? Let's consider two vectors: (1, 3) and (3, 1). Now that we have two, what can we do with them?

#frame(cetz.canvas({
  // import cetz.draw: *
  plot_line_color_setup()
  plot.plot(size: (4, 4), name: "plot",
    x-tick-step: 1, x-min: 0, x-max: 4,
    y-tick-step: 1, y-min: 4, y-max: 0,
    x-grid: true,
    y-grid: true,
    legend: none,
    {
      plot.add(((0, 0), (.01, .01)), style: (stroke: text-color))

      plot.add-anchor("origin", (0, 0))
      plot.add-anchor("a", (1, 3))
      plot.add-anchor("b", (3, 1))
    })

  draw_vector("plot.b", red)
  draw_vector("plot.a", blue)
}))

One immediate thing we can do is add them. Vector addition is done component-wise, meaning we add the corresponding elements of each vector:

- x-components: #maybe_html_frame[$3 + 1 = 4$]
- y-components: #maybe_html_frame[$1 + 3 = 4$]

So, the result of adding (3, 1) and (1, 3) is a new vector: (4, 4).

Visually, we can also interpret this geometrically. If we place the second vector so that it starts at the tip of the first, we form a shape. Likewise, if we reverse the order, placing the first vector at the tip of the second, we form the same shape. The result is a tilted square-like figure, known as a parallelogram.

#frame(cetz.canvas({
  // import cetz.draw: *
  plot_line_color_setup()
  plot.plot(size: (5, 5), name: "plot",
    x-tick-step: 1, x-min: 0, x-max: 5,
    y-tick-step: 1, y-min: 5, y-max: 0,
    x-grid: true,
    y-grid: true,
    legend: none,
    {
      plot.add(((0, 0), (.01, .01)), style: (stroke: text-color))

      plot.add-anchor("origin", (0, 0))
      plot.add-anchor("a", (1, 3))
      plot.add-anchor("b", (3, 1))
      plot.add-anchor("res", (4, 4))
    })

  draw_vector("plot.a", blue)
  draw_vector("plot.b", red)
  draw_full_vector("plot.a", "plot.res", red)
  draw_full_vector("plot.b", "plot.res", blue)
  draw_vector("plot.res", green)
}))

Parallelograms formed by vector addition will become more important later, so it's a good idea to keep them in mind.

== Vector Subtraction

Next, let's consider subtraction.

Take the vectors (3, 1) and (1, 3) again. If we subtract them component-wise:

- x-components: #maybe_html_frame[$3 - 1 = 2$]
- y-components: #maybe_html_frame[$1 - 3 = -2$]

This gives us the new vector: (2, -2).

#frame(cetz.canvas({
  // import cetz.draw: *
  plot_line_color_setup()
  plot.plot(size: (4, 4), name: "plot",
    x-tick-step: 1, x-min: 0, x-max: 4,
    y-tick-step: 1, y-min: 4, y-max: 0,
    x-grid: true,
    y-grid: true,
    legend: none,
    {
      plot.add(((0, 0), (.01, .01)), style: (stroke: text-color))

      plot.add-anchor("origin", (0, 0))
      plot.add-anchor("a", (1, 3))
      plot.add-anchor("b", (3, 1))
      plot.add-anchor("res", (2, -2))
    })

  draw_vector("plot.a", blue)
  draw_vector("plot.b", red)
  draw_vector("plot.res", green)
}))

What does this vector represent? Geometrically, it points from one vector to the other. In this case, subtracting (1, 3) from (3, 1) [(3, 1) - (1, 3)] gives the vector from the tip of (1, 3) (the second vector) to the tip of (3, 1) (the first vector).

#frame(cetz.canvas({
  // import cetz.draw: *
  plot_line_color_setup()
  plot.plot(size: (4, 4), name: "plot",
    x-tick-step: 1, x-min: 0, x-max: 4,
    y-tick-step: 1, y-min: 4, y-max: 0,
    x-grid: true,
    y-grid: true,
    legend: none,
    {
      plot.add(((0, 0), (.01, .01)), style: (stroke: text-color))

      plot.add-anchor("origin", (0, 0))
      plot.add-anchor("a", (1, 3))
      plot.add-anchor("b", (3, 1))
      plot.add-anchor("res", (4, 4))
    })

  draw_vector("plot.a", blue)
  draw_vector("plot.b", red)
  draw_full_vector("plot.a", "plot.b", green)
}))

If we reverse the subtraction — that is, (1, 3) - (3, 1) — we get (-2, 2), which is the same vector but pointing in the opposite direction.

#frame(cetz.canvas({
  // import cetz.draw: *
  plot_line_color_setup()
  plot.plot(size: (4, 4), name: "plot",
    x-tick-step: 1, x-min: 0, x-max: 4,
    y-tick-step: 1, y-min: 4, y-max: 0,
    x-grid: true,
    y-grid: true,
    legend: none,
    {
      plot.add(((0, 0), (.01, .01)), style: (stroke: text-color))

      plot.add-anchor("origin", (0, 0))
      plot.add-anchor("a", (1, 3))
      plot.add-anchor("b", (3, 1))
      plot.add-anchor("res", (4, 4))
    })

  draw_vector("plot.a", blue)
  draw_vector("plot.b", red)
  draw_full_vector("plot.b", "plot.a", green)
}))

=== Why Is Subtraction Useful?

Let's look at our subtraction result: (2, -2). First, we can calculate its length:

#frame[$"length" = sqrt(2^2 + (-2)^2) = sqrt(4 + 4) = sqrt(8) approx 2.82$]

We can then normalize it to get the unit vector pointing in that direction:

#frame[$(2, -2) \/ sqrt(8) =  (2 / sqrt(8), -2 / sqrt(8)) approx (.7, -.7)$]

This gives us a unit vector in the same direction as (2, -2), which is useful for defining direction without regard to magnitude. We can scale this unit vector up or down depending on the application.

But there's another useful insight here: if we treat (3, 1) and (1, 3) not as arrows but simply as points in space, then the vector (2, -2) represents the straight-line path from one point to the other. Its length (2.82) is the distance between those two points.

So, vector subtraction not only gives us direction but also lets us measure how far apart two points are. That's a pretty useful concept in both math and physics.

== Cross Product in 3D Space

Let's shift our focus to 3D space. We're going to explore something unique to 3D vectors—a concept known as the cross product.

Although variations of the cross product exist in other spaces, it's primarily understood and used in three dimensions.

=== Defining a Plane

Before diving into the cross product, we need to talk about how to define a plane in 3D space. You can define a plane using either three points or two vectors that lie within it.

For example, consider two vectors:
+ #maybe_html_frame[$A = (1, 2, 0)$]
+ #maybe_html_frame[$B = (2, 1, 0)$]

Which define the points:
+ #maybe_html_frame[$(0, 0, 0)$]
+ #maybe_html_frame[$(1, 2, 0)$]
+ #maybe_html_frame[$(2, 1, 0)$]

These two vectors (lying on the XY-plane) define a flat surface. You could make more complex planes by choosing points with different z-values, but this simple setup is enough to illustrate the concept.

=== The Cross Product

Now, suppose we want to find a vector that points straight up: a vector perpendicular to the plane formed by A and B. This perpendicular vector is known as a normal vector, and we calculate it using the cross product.

In practical terms, imagine bouncing a ball off a surface. The angle of incidence (the angle it hits the surface/green) and the angle of reflection (the angle it bounces away/blue) are equal. To calculate this reflection correctly, you need the normal vector (red) to the surface.

#frame(cetz.canvas({
  // import cetz.draw: *
  plot_line_color_setup()
  plot.plot(size: (4, 2), name: "plot",
    x-tick-step: 1, x-min: 0, x-max: 4,
    y-tick-step: 1, y-min: 2, y-max: 0,
    x-grid: true,
    y-grid: true,
    legend: none,
    {
      plot.add(((0, 0), (.01, .01)), style: (stroke: text-color))

      plot.add-anchor("origin", (0, 0))
      plot.add-anchor("bounce", (2, 2))
      plot.add-anchor("normal", (2, 1))
      plot.add-anchor("topleft", (4, 0))
    })

  draw_vector("plot.bounce", green)
  draw_full_vector("plot.bounce", "plot.topleft", blue)
  draw_full_vector("plot.bounce", "plot.normal", red)
  // draw_vector("plot.a", blue)
  // draw_vector("plot.b", red)
  // draw_full_vector("plot.b", "plot.a", green)
}))

The cross product A \* B results in a new vector C = (x, y, z). The formula is as follows:

#frame[$
c_x = a_y * b_z - a_z * b_y #linebreak()
c_y = a_z * b_x - a_x * b_z #linebreak()
c_z = a_x * b_y - a_y * b_x #linebreak()
$]

This structure is consistent across all components: you multiply the components that *aren't present* in the result, then subtract the reverse order.

Let's apply this to our plane vectors:
- A = (2, 1, 0) (red)
- B = (1, 2, 0) (blue)

#frame(cetz.canvas({
  // import cetz.draw: *
  plot_line_color_setup()
  plot.plot(size: (4, 4), name: "plot",
    x-tick-step: 1, x-min: 0, x-max: 4,
    y-tick-step: 1, y-min: 4, y-max: 0,
    x-grid: true,
    y-grid: true,
    legend: none,
    {
      plot.add(((0, 0), (.01, .01)), style: (stroke: text-color))

      plot.add-anchor("origin", (0, 0))
      plot.add-anchor("a", (2, 1))
      plot.add-anchor("b", (1, 2))
    })

  draw_vector("plot.a", red)
  draw_vector("plot.b", blue)
}))

Substituting into the formula:

#frame[$
x = (1 * 0) - (0 * 2) = 0 #linebreak()
y = (0 * 1) - (2 * 0) = 0 #linebreak()
z = (2 * 2) - (1 * 1) = 4 - 1 = 3 #linebreak()
$]

So the result is the vector (0, 0, 3).

This vector points straight up, perpendicular to the plane formed by A and B—just as we expected.

=== Geometric Interpretation: Area

Here's an interesting geometric fact: the length (or magnitude) of the cross product vector equals the area of the parallelogram formed by the two original vectors.

In our case, he magnitude of (0, 0, 3) is 3: so, the parallelogram formed by A and B has an area of 3.
And since a triangle is half of a parallelogram, the area of the triangle defined by vectors A and B is 1.5.

In computer graphics, most shapes are rendered as triangles. Knowing the area of a triangle is crucial for things like weighting, shading, or physics calculations. One common approach is to compute the cross product of two sides of a triangle and use its magnitude to determine area-related properties.


== Dot Product

We've already seen the cross product, but there's another very useful operation involving vectors: the dot product.

Imagine we have two vectors, and we want to understand how they relate in terms of their directions.

Take two vectors for example:

- Green vector: (3, 1)
- Blue vector: (2, 4)

#frame(cetz.canvas({
  // import cetz.draw: *
  plot_line_color_setup()
  plot.plot(size: (4, 4), name: "plot",
    x-tick-step: 1, x-min: 0, x-max: 4,
    y-tick-step: 1, y-min: 4, y-max: 0,
    x-grid: true,
    y-grid: true,
    legend: none,
    {
      plot.add(((0, 0), (.01, .01)), style: (stroke: text-color))

      plot.add-anchor("origin", (0, 0))
      plot.add-anchor("a", (3, 1))
      plot.add-anchor("b", (2, 4))
    })

  draw_vector("plot.a", green)
  draw_vector("plot.b", blue)
}))

To calculate the dot product of these two vectors, we multiply their components element-wise and then add the results:

#frame[$"green".x * "blue".x + "green".y * "blue".y = 3 * 2 + 1 * 4 = 6 + 4 = 10 $]

The dot product is a measure of how much two vectors point in the same direction.
If two vectors are perfectly perpendicular (at right angles), their dot product is 0.
If they point roughly in opposite directions, their dot product is less than 0 (negative).

So the number 10 from our example tells us the green and blue vectors point roughly in the same direction... but what exactly does the 10 represent?

=== Interpreting the Dot Product as a Projection

It helps to consider unit vectors (vectors with length 1) for clarity.

For the blue vector (2, 4), we calculate its length:

#frame[$sqrt(2^2 + 4^2) = sqrt(4 + 16) = sqrt(20) approx 4.47$]

Dividing each component by 4.47 gives the unit vector:

#frame[$(2, 4) \/ 4.47 = (2 / 4.47, 4 / 4.47) approx (.44, .89)$]

#frame(cetz.canvas({
  // import cetz.draw: *
  plot_line_color_setup()
  plot.plot(size: (4, 4), name: "plot",
    x-tick-step: 1, x-min: 0, x-max: 4,
    y-tick-step: 1, y-min: 4, y-max: 0,
    x-grid: true,
    y-grid: true,
    legend: none,
    {
      plot.add(((0, 0), (.01, .01)), style: (stroke: text-color))

      plot.add-anchor("origin", (0, 0))
      plot.add-anchor("a", (3, 1))
      plot.add-anchor("b", (2, 4))
      plot.add-anchor("unit", (.44, .89))
    })

  draw_vector("plot.a", green)
  draw_vector("plot.b", blue)
  draw_vector("plot.unit", red)
}))

Now, taking the dot product of the green vector (3, 1) with this unit vector:

#frame[$3 * 0.44 + 1 * 0.89 = 1.32 + 0.89 = 2.21$]

The value 2.21 represents the length of the projection of the green vector onto the blue vector's direction.

If you multiply the blue unit vector by 2.21, you get a vector representing the part of the green vector along the blue vector's direction. Notice how the dashed line and the blue vector are normal (90 degrees) to each other?

#frame(cetz.canvas({
  // import cetz.draw: *
  plot_line_color_setup()
  plot.plot(size: (4, 4), name: "plot",
    x-tick-step: 1, x-min: 0, x-max: 4,
    y-tick-step: 1, y-min: 4, y-max: 0,
    x-grid: true,
    y-grid: true,
    legend: none,
    {
      plot.add(((0, 0), (.01, .01)), style: (stroke: text-color))

      plot.add-anchor("origin", (0, 0))
      plot.add-anchor("a", (3, 1))
      plot.add-anchor("b", (2, 4))
      plot.add-anchor("proj", (.44 * 2.21, .89 * 2.21))
    })

  draw_vector("plot.a", green)
  draw_vector("plot.b", blue)
  draw_vector("plot.proj", red)
  cetz.draw.line("plot.a", "plot.proj", stroke: (paint: text-color, dash: "dashed"))
}))

So, the dot product between a vector and a unit vector tells you the length of the vector in the direction of that unit vector.

=== Using the Dot Product for Reflection

Remember when we talked about bouncing a ball off a surface? Let's analyze the reflection vector.

- We have an incoming direction (green vector).
- The surface's normal vector (red vector), which we assume is a unit vector.
- The reflected vector (blue vector) we want to find.

#frame(cetz.canvas({
  // import cetz.draw: *
  plot_line_color_setup()
  plot.plot(size: (4, 2), name: "plot",
    x-tick-step: 1, x-min: 0, x-max: 4,
    y-tick-step: 1, y-min: 2, y-max: 0,
    x-grid: true,
    y-grid: true,
    legend: none,
    {
      plot.add(((0, 0), (.01, .01)), style: (stroke: text-color))

      plot.add-anchor("origin", (0, 0))
      plot.add-anchor("bounce", (2, 2))
      plot.add-anchor("normal", (2, 1))
      plot.add-anchor("topright", (4, 0))
      plot.add-anchor("bottomleft", (0, 2))
      plot.add-anchor("bottomleft", (0, 4))
    })

  draw_vector("plot.bounce", green)
  draw_full_vector("plot.bounce", "plot.topright", blue)
  draw_full_vector("plot.bounce", "plot.normal", red)
  // draw_vector("plot.a", blue)
  // draw_vector("plot.b", red)
  // draw_full_vector("plot.b", "plot.a", green)
}))

The key insight is that the reflection vector can be thought of as the incoming vector projected along the normal and then flipped, while the component perpendicular to the normal remains unchanged.

To find the reflection, we break the incoming vector d (direction) into two parts:

1. The component along the normal vector n (the ^ indicates a unit vector/orange):

#frame[$"orange" = (d dot hat(n)) * hat(n)$]

2. The component perpendicular to the normal (purple):

#frame[$"purple" = d - "orange"$]

The reflection vector (blue) is then:

#frame[$"blue" = -"orange" + "purple"$]

Since we flip the component along the normal and keep the perpendicular part as is.

#frame(cetz.canvas({
  // import cetz.draw: *
  plot_line_color_setup()
  plot.plot(size: (4, 2), name: "plot",
    x-tick-step: 1, x-min: 0, x-max: 4,
    y-tick-step: 1, y-min: 2, y-max: 0,
    x-grid: true,
    y-grid: true,
    legend: none,
    {
      plot.add(((0, 0), (.01, .01)), style: (stroke: text-color))

      plot.add-anchor("origin", (0, 0))
      plot.add-anchor("bounce", (2, 2))
      plot.add-anchor("normal", (2, 1))
      plot.add-anchor("topmiddle", (2, 0))
      plot.add-anchor("topright", (4, 0))
      plot.add-anchor("bottomleft", (0, 2))
      plot.add-anchor("bottomright", (4, 2))
    })

  draw_vector("plot.bounce", green)
  draw_full_vector("plot.bounce", "plot.topright", blue)
  draw_full_vector("plot.bounce", "plot.normal", red)
  draw_full_vector("plot.topmiddle", "plot.bounce", orange)
  draw_full_vector("plot.bottomleft", "plot.bounce", purple)
  draw_full_vector("plot.bottomleft", "plot.bounce", purple)
  // draw_vector("plot.a", blue)
  // draw_vector("plot.b", red)
  // draw_full_vector("plot.b", "plot.a", green)
}))


Writing this out in a compact formula:

#frame[$"reflection" = d - 2(d dot hat(n))hat(n)$]

This formula lets you calculate the bounce direction of a vector reflecting off a surface, using the dot product to project onto the normal and then flipping that component.

= Angles and Rotations

It's time to shift focus from vectors to angles.

If we map every possible unit vector, and plot just their end points it will create a circle of radius 1 centered at the origin. Every point on this "unit circle" thus corresponds to a vector of length 1.

For example:

- This blue vector lies at the rightmost point on the circle.
- This white vector points roughly halfway up.
- This red vector points roughly halfway down.

#frame(cetz.canvas({
  // import cetz.draw: *
  plot_line_color_setup()
  plot.plot(size: (4, 4), name: "plot",
    x-tick-step: 1, x-min: -1, x-max: 1,
    y-tick-step: 1, y-min: -1, y-max: 1,
    x-grid: true,
    y-grid: true,
    legend: none,
    {
      plot.add(((0, 0), (.01, .01)), style: (stroke: text-color))

      plot.add-anchor("origin", (0, 0))
      plot.add-anchor("blue", (1, 0))
      plot.add-anchor("white", (.7, .7))
      plot.add-anchor("red", (.7, -.7))
    })

    cetz.draw.circle("plot.origin", radius: 2, stroke: 2pt + red)
    draw_vector("plot.blue", blue)
    draw_vector("plot.white", white)
    draw_vector("plot.red", red)
}))

Most people learn in school that a full circle measures 360 degrees. This means:

- Halfway around the circle is 180 degrees.

#frame(cetz.canvas({
  // import cetz.draw: *
  plot_line_color_setup()
  plot.plot(size: (4, 4), name: "plot",
    x-tick-step: 1, x-min: -1, x-max: 1,
    y-tick-step: 1, y-min: -1, y-max: 1,
    x-grid: true,
    y-grid: true,
    legend: none,
    {
      plot.add(((0, 0), (.01, .01)), style: (stroke: text-color))

      plot.add-anchor("origin", (0, 0))
      plot.add-anchor("start", (1, 0))
      plot.add-anchor("end", (-1, 0))

    })

    cetz.draw.circle("plot.origin", radius: 2, stroke: 2pt + red)
    cetz.angle.angle("plot.origin", "plot.start", "plot.end", label: $180 degree$, radius: 1.5, fill: rgb(0, 100%, 0, 25%), stroke: none)
}))

- The blue vector at the rightmost point corresponds to both 0 degrees and 360 degrees because the circle wraps around.

#frame(cetz.canvas({
  // import cetz.draw: *
  plot_line_color_setup()
  plot.plot(size: (4, 4), name: "plot",
    x-tick-step: 1, x-min: -1, x-max: 1,
    y-tick-step: 1, y-min: -1, y-max: 1,
    x-grid: true,
    y-grid: true,
    legend: none,
    {
      plot.add(((0, 0), (.01, .01)), style: (stroke: text-color))

      plot.add-anchor("origin", (0, 0))
      plot.add-anchor("start", (1, 0))
      plot.add-anchor("end", (1, -.01))

    })

    cetz.draw.circle("plot.origin", radius: 2, stroke: 2pt + red)
    cetz.angle.angle("plot.origin", "plot.start", "plot.end", label: $0 degree \/ 360 degree$, radius: 1.5, fill: rgb(0, 0, 100%, 25%), stroke: none)
    draw_vector("plot.start", blue)
}))

- The white vector, about halfway up, corresponds roughly to 45 degrees.

#frame(cetz.canvas({
  // import cetz.draw: *
  plot_line_color_setup()
  plot.plot(size: (4, 4), name: "plot",
    x-tick-step: 1, x-min: -1, x-max: 1,
    y-tick-step: 1, y-min: -1, y-max: 1,
    x-grid: true,
    y-grid: true,
    legend: none,
    {
      plot.add(((0, 0), (.01, .01)), style: (stroke: text-color))

      plot.add-anchor("origin", (0, 0))
      plot.add-anchor("start", (1, 0))
      plot.add-anchor("end", (.7, .7))

    })

    cetz.draw.circle("plot.origin", radius: 2, stroke: 2pt + red)
    cetz.angle.angle("plot.origin", "plot.start", "plot.end", label: $45 degree$, radius: 1.4, fill: rgb(0, 0, 0, 25%), stroke: none)
    draw_vector("plot.end", white)
}))

- The red vector, about halfway down, corresponds roughly to -45 degrees, or equivalently 315 degrees (since 360 - 45 = 315).

#frame(cetz.canvas({
  // import cetz.draw: *
  plot_line_color_setup()
  plot.plot(size: (4, 4), name: "plot",
    x-tick-step: 1, x-min: -1, x-max: 1,
    y-tick-step: 1, y-min: -1, y-max: 1,
    x-grid: true,
    y-grid: true,
    legend: none,
    {
      plot.add(((0, 0), (.01, .01)), style: (stroke: text-color))

      plot.add-anchor("origin", (0, 0))
      plot.add-anchor("end", (1, 0))
      plot.add-anchor("start", (.7, -.7))

    })

    cetz.draw.circle("plot.origin", radius: 2, stroke: 2pt + red)
    cetz.angle.angle("plot.origin", "plot.start", "plot.end", label: $-45 degree$, radius: 1.5, fill: rgb(100%, 0, 0, 25%), stroke: none)
    draw_vector("plot.start", red)
}))

We can describe vectors by their direction in terms of the angle they make with a reference axis. For example: to rotate the red vector to align with the white vector, you need to rotate by 90 degrees (45 degrees + 45 degrees).

#frame(cetz.canvas({
  // import cetz.draw: *
  plot_line_color_setup()
  plot.plot(size: (4, 4), name: "plot",
    x-tick-step: 1, x-min: -1, x-max: 1,
    y-tick-step: 1, y-min: -1, y-max: 1,
    x-grid: true,
    y-grid: true,
    legend: none,
    {
      plot.add(((0, 0), (.01, .01)), style: (stroke: text-color))

      plot.add-anchor("origin", (0, 0))
      plot.add-anchor("end", (.7, .7))
      plot.add-anchor("start", (.7, -.7))

    })

    cetz.draw.circle("plot.origin", radius: 2, stroke: 2pt + red)
    cetz.angle.angle("plot.origin", "plot.start", "plot.end", label: $90 degree$, radius: 1.5, fill: rgb(0, 100%, 0, 25%), stroke: none)
    draw_vector("plot.end", white)
    draw_vector("plot.start", red)
}))

=== Introducing Radians

Degrees are intuitive but mathematicians prefer to measure angles in radians. The circumference of a circle is roughly 3.14 times its radius.This special number, 3.14, is called pi (π). It even has its down day celebrating it on March 14th (3/14).

In radians:

- Half a circle (180 degrees) equals π radians.

#frame(cetz.canvas({
  // import cetz.draw: *
  plot_line_color_setup()
  plot.plot(size: (4, 4), name: "plot",
    x-tick-step: 1, x-min: -1, x-max: 1,
    y-tick-step: 1, y-min: -1, y-max: 1,
    x-grid: true,
    y-grid: true,
    legend: none,
    {
      plot.add(((0, 0), (.01, .01)), style: (stroke: text-color))

      plot.add-anchor("origin", (0, 0))
      plot.add-anchor("start", (1, 0))
      plot.add-anchor("end", (-1, 0))

    })

    cetz.draw.circle("plot.origin", radius: 2, stroke: 2pt + red)
    cetz.angle.angle("plot.origin", "plot.start", "plot.end", label: $180 degree = pi$, radius: 1.5, fill: rgb(0, 100%, 0, 25%), stroke: none)
}))

- A full circle (360 degrees) equals 2π radians.

#frame(cetz.canvas({
  // import cetz.draw: *
  plot_line_color_setup()
  plot.plot(size: (4, 4), name: "plot",
    x-tick-step: 1, x-min: -1, x-max: 1,
    y-tick-step: 1, y-min: -1, y-max: 1,
    x-grid: true,
    y-grid: true,
    legend: none,
    {
      plot.add(((0, 0), (.01, .01)), style: (stroke: text-color))

      plot.add-anchor("origin", (0, 0))
      plot.add-anchor("start", (1, 0))
      plot.add-anchor("end", (1, -.01))

    })

    cetz.draw.circle("plot.origin", radius: 2, stroke: 2pt + red)
    cetz.angle.angle("plot.origin", "plot.start", "plot.end", label: $360 degree = 2pi$, radius: 1.5, fill: rgb(0, 100%, 0, 25%), stroke: none)
}))

- A right angle (90 degrees) equals π/2 radians.

#frame(cetz.canvas({
  // import cetz.draw: *
  plot_line_color_setup()
  plot.plot(size: (4, 4), name: "plot",
    x-tick-step: 1, x-min: -1, x-max: 1,
    y-tick-step: 1, y-min: -1, y-max: 1,
    x-grid: true,
    y-grid: true,
    legend: none,
    {
      plot.add(((0, 0), (.01, .01)), style: (stroke: text-color))

      plot.add-anchor("origin", (0, 0))
      plot.add-anchor("start", (1, 0))
      plot.add-anchor("end", (0, 1))

    })

    cetz.draw.circle("plot.origin", radius: 2, stroke: 2pt + red)
    cetz.angle.angle("plot.origin", "plot.start", "plot.end", label: $90 degree = pi/2$, radius: 1.5, fill: rgb(0, 100%, 0, 25%), stroke: none)
}))

Keep this in mind as it makes understanding rotations easier.

== How Do We Perform Rotations?

Now we introduce a concept that may seem intimidating: the matrix.

Consider this 2x2 matrix:

#frame[$
mat(
  cos(a), -sin(a);
  sin(a), cos(a)
)
$]

Multiplying this matrix by a vector (x, y) (written vertically) rotates the vector by an angle `a`.

Before we proceed, let's clarify what sine and cosine actually are.


=== What is Sine?

The sine function measures how far up (along the y-axis) a point on the unit circle is.
When the angle is 0, sine is 0 (we're at the origin horizontally).
At π/2 (90 degrees), sine reaches its maximum value of 1 (the highest point on the unit circle).
At π (180 degrees), sine returns to 0.
At (3π)/2 (270 degrees), sine goes down to -1 (the lowest point).
And at 2π (360 degrees), sine returns back to 0.

If you plot sine over these angles, it forms a smooth wave that oscillates between 1 and -1 — the famous sine wave.

#frame(cetz.canvas({
  // import cetz.draw: *
  plot_line_color_setup()

  plot.plot(size: (12, 8),
    x-tick-step: calc.pi/2,
    x-format: plot.formats.multiple-of,
    y-tick-step: 2, y-min: -1, y-max: 1,
    legend: none,
    {
      let domain = (0, 2 * calc.pi)

      plot.add(calc.sin, domain: domain, style: (stroke: red))
    })
}))

=== What is Cosine?

Cosine measures how far right (along the x-axis) a point on the unit circle is.
At angle 0, cosine is 1 (furthest right on the circle).
At π/2, cosine goes down to 0 (the top of the circle).
At π, cosine becomes -1 (furthest left).
At 3π/2, cosine goes back to 0.
And at 2π, cosine returns to 1.

Plotting cosine creates a wave similar to sine, but shifted — it looks like sine slid sideways.

#frame(cetz.canvas({
  // import cetz.draw: *
  plot_line_color_setup()

  plot.plot(size: (12, 8),
    x-tick-step: calc.pi/2,
    x-format: plot.formats.multiple-of,
    y-tick-step: 2, y-min: -1, y-max: 1,
    legend: none,
    {
      let domain = (0, 2 * calc.pi)

      plot.add(calc.cos, domain: domain, style: (stroke: red))
    })
}))

=== Connecting to Vectors

If you know the angle a vector makes with the horizontal axis:

- The x-component of the vector is equal to the cosine of that angle.
- The y-component of the vector is equal to the sine of that angle.

#frame(cetz.canvas(length: 3cm, {
  import cetz.draw: *

  set-style(
    mark: (fill: black, scale: 2),
    stroke: (thickness: 0.4pt, cap: "round"),
    angle: (
      radius: 0.3,
      label-radius: .22,
      fill: green.lighten(80%),
      stroke: (paint: green.darken(50%))
    ),
    content: (padding: 1pt)
  )

  grid((-1.5, -1.5), (1.4, 1.4), step: 0.5, stroke: gray + 0.2pt)

  circle((0,0), radius: 1, stroke: green)

  line((-1.5, 0), (1.5, 0), mark: (end: "stealth"), stroke: text-color)
  content((), $ x $, anchor: "west")
  line((0, -1.5), (0, 1.5), mark: (end: "stealth"), stroke: text-color)
  content((), $ y $, anchor: "south")

  for (x, ct) in ((-1, $ -1 $), (-0.5, $ -1/2 $), (1, $ 1 $)) {
    line((x, 3pt), (x, -3pt), stroke: text-color)
    content((), anchor: "north", ct)
  }

  for (y, ct) in ((-1, $ -1 $), (-0.5, $ -1/2 $), (0.5, $ 1/2 $), (1, $ 1 $)) {
    line((3pt, y), (-3pt, y), stroke: text-color)
    content((), anchor: "east", ct)
  }

  // Draw the green angle
  cetz.angle.angle((0,0), (1,0), (1, calc.tan(30deg)),
    label: text(green, [$a$]))

  line((0,0), (1, calc.tan(30deg)), stroke: text-color, mark: (end: "straight"))

  set-style(stroke: (thickness: 1.2pt))

  line((30deg, 1), ((), "|-", (0,0)), stroke: (paint: red), name: "sin")
  content(("sin.start", 50%, "sin.end"), text(red)[$ sin a $])
  line("sin.end", (0,0), stroke: (paint: blue), name: "cos")
  content(("cos.start", 50%, "cos.end"), text(blue)[$ cos a $], anchor: "north")
}))

= Matrices

Let's shift back to the idea of matrices, but instead of starting with the rotation matrix, let's begin with a simpler one.

Consider the matrix:

#frame[$
  mat(1, 0; 0, 1)
$]

and multiply it by the vector (2, 2).

When we multiply a matrix by a vector, we take each row of the matrix and compute the dot product with the vector to get each component of the resulting vector.

For this matrix:

- The first row (1, 0) dot product with (2, 2) is:

  #frame[$1 * 2 + 0 * 2 = 2$]

- The second row (0, 1) dot product with (2, 2) is:

  #frame[$0 * 2 + 1 * 2 = 2$]

Thus:

#frame[$
  mat(1, 0; 0, 1) * mat(2; 2) = mat(2; 2)
$]

The resulting vector is (2, 2), the same as our original vector.
This matrix is called the "identity matrix" because multiplying any vector by it leaves the vector unchanged.

== Scaling with a Matrix

Now, what if we take the identity matrix and multiply every element by a number, say 3? The matrix becomes:

#frame[$
  mat(3, 0; 0, 3)
$]

Multiplying this matrix by the vector (2, 2):

#frame[$
  mat(3, 0; 0, 3) * mat(2; 2) = mat((3,0) dot (2,2); (0, 3) dot (2,2))= mat(3 * 2 + 0 * 2; 0 * 2 + 3 * 2) = mat(6; 6)
$]

The resulting vector is (6, 6), which is the original vector scaled by 3. Matrices like this are called "scale matrices" because they scale vectors.


== Rotation Matrix Example

Recall the rotation matrix:

#frame[$
mat(
  cos(a), -sin(a);
  sin(a), cos(a)
)
$]

For a rotation of 45 degrees, convert degrees to radians (π/4):

Approximating sine and cosine values:

- #maybe_html_frame[$sin(pi/4) approx .7$]
- #maybe_html_frame[$cos(pi/4) approx .7$]

The rotation matrix becomes:

#frame[$
mat(
  .7, -.7;
  .7, .7
)
$]

Multiplying this matrix by the vector (2, 2):

#frame[$
  mat(.7, -.7; .7, .7) * mat(2; 2) = mat((.7,-.7) dot (2,2); (.7, .7) dot (2,2))= mat(.7 * 2 + (-.7) * 2; .7 * 2 + .7 * 2) = mat(0; 2.8)
$]

This means the vector (2, 2), when rotated 45 degrees, points roughly straight down with a length about 2.8 (remember that in graphics y goes down).

#frame(cetz.canvas({
  // import cetz.draw: *
  plot_line_color_setup()
  plot.plot(size: (4, 4), name: "plot",
    x-tick-step: 1, x-min: 0, x-max: 4,
    y-tick-step: 1, y-min: 4, y-max: 0,
    x-grid: true,
    y-grid: true,
    legend: none,
    {
      plot.add(((0, 0), (.01, .01)), style: (stroke: text-color))

      plot.add-anchor("origin", (0, 0))
      plot.add-anchor("a", (2, 2))
      plot.add-anchor("b", (0, 2.8))
    })

  draw_vector("plot.a", green)
  draw_vector("plot.b", blue)
  cetz.angle.angle("plot.origin", "plot.b", "plot.a", label: $45 degree$, radius: 2.8, fill: rgb(100%, 0, 0, 25%), stroke: none)
}))

== Matrix-Matrix Multiplication

One more thing worth discussing while we're on the subject of matrices is what happens when we multiply two matrices together.

Suppose we have two matrices:

#frame[$
mat(A, B; C, D) "and" mat(E, F; G, H)
$]

We can think of the second matrix as two vectors: 
#frame[$mat(E; G)$] 
and 
#frame[$mat(F; H)$]

We already know how to multiply a matrix by a vector: we take each row of the first matrix, dot product it with the vector, and put the result in each "row" of the vector. So, when multiplying the two matrices, we take each row of the first matrix and dot product it with each column vector of the second matrix.

That means the resulting matrix elements are:

#frame[$
mat(A, B; C, D) * mat(E, F; G, H) = mat((A, B) dot (E, G), (A, B) dot (F, H); (C, D) dot (E, G), (C, D) dot (F, H))
$]

Working through these calculations manually is tedious and repetitive, which is why you should let a computer or calculator handle matrix multiplication—it makes your life much easier.

== Extending Matrices to 3D

Everything we've talked about with 2D matrices extends to 3D matrices. The multiplication process remains the same—dot products between rows and columns. The identity matrix in 3D looks like this:

#frame[$
mat(1, 0, 0; 0, 1, 0; 0, 0, 1)
$]

It's just ones along the diagonal and zeros everywhere else.

Rotation matrices in 3D are more complicated. Instead of a simple 2x2 matrix, we now have a 3x3 matrix with rotation values placed around it, depending on the axis of rotation.

This complexity raises questions like: when we say "rotate 45 degrees," around which axis do we rotate? The x-axis? The y-axis? The z-axis? Some other arbitrary axis?

This means we need to think about rotations as a combination of an axis and an angle.

== Euler Angles

To manage this, we often use what are called Euler angles. Euler defined rotations as a sequence of rotations around the X, Y, and then Z axes. To compute these rotations, we:

1. Build a rotation matrix for the X axis,
2. Multiply it by the rotation matrix for the Y axis,
3. Multiply that result by the rotation matrix for the Z axis.

You multiply all these matrices together in this order to get a combined rotation matrix.

Some systems allow changing the order (like Z, X, Y), but usually, the order is X, Y, Z, following spatial intuition.

== The Gimbal Lock Problem

However, Euler angles have a problem: gimbal lock. When one axis rotates by 90 degrees, the other two axes can align and start rotating around the same plane, causing a loss of one degree of freedom.

Visually, if you rotate around Y properly, the rotations around X and Z can lie in the same plane, making them indistinguishable.

This problem doesn't cause issues when entering static rotation values, but it creates complications when blending multiple rotations for animations.

To solve this problem, we use a concept called quaternions. In an upcoming discussion, we'll explore quaternions and how they provide a more robust and smooth way to handle 3D rotations without the gimbal lock issue.

== Transformation Matrices and Homogeneous Coordinates

So far, we've seen how to write scale matrices, and how to create rotation matrices. But how do we handle movement or sliding in space — in other words, translation matrices?

It turns out that to represent translation properly, we need to move into 4D space. This is similar to quaternions: quaternions are a 4D extension used to smooth rotations. Similarly, translation requires us to extend our coordinates from 3D to 4D.

Here's how it works: we start with our normal 3D coordinates (X, Y, Z), and then add a fourth coordinate, either 1 or 0. When this fourth value is 1, it means we are dealing with a point — something that can be translated or moved around in space. When it is 0, it means we are dealing with a direction — which can only represent orientation and cannot be moved around.

Next, we create a new 4x4 matrix that combines scale, rotation, and translation:

- The upper-left 3x3 portion contains the scale and rotation information.
- The rightmost column (excluding the last element) contains the translation values along the X, Y, and Z axes.
- The bottom row is filled mostly with zeros, except the last element, which is 1.

#frame[$mat(
#table(columns: (15pt, 15pt, 15pt, 15pt), stroke: none, align: center + horizon,
  table.cell(colspan: 3, rowspan: 3, [Scale/Rotation Matrix]), [X], [Y], [Z],
  [0], [0], [0], [1]
)
)$]


This is called homogeneous coordinates, and the resulting 4x4 matrix is known as a transformation matrix. It can encode position, rotation, and scale all in one matrix — which are the main transformations we need when positioning a 3D model in a virtual world.

So, while we've covered a lot of complicated math, thankfully, it's all manageable once you understand the basic concepts.

= Basic Physics

The last topic we'll cover today is some very basic physics. Let's imagine you are a point in space, and you have a velocity vector that tells you the speed and direction you want to move. Where will this point be after applying that vector?

Well, if you're moving at, say, five meters per second, then after one second, you should be exactly five meters away from your starting position.

How can we represent this in a computer? We simply update the position by adding the velocity vector to it. Since both position and velocity can be treated as vectors, this addition is straightforward. If we use homogeneous coordinates, the position vector's \( W \) component would be 1 (since it's a point), and the velocity vector's \( W \) would be 0 (since it's a direction).

#frame[$
"position" = "position" + "velocity";
$]

However, there's a practical issue with this simple approach. Usually, we run this update inside a loop that runs every frame. Imagine you're running your game at 60 frames per second (fps) — everything looks smooth. But your friend runs the same game on a slower machine that only manages 5 fps. What happens then? Your character would move much faster than your friend's because their velocity updates happen less frequently but cover the same distance each time.

To fix this, we multiply the velocity by the time elapsed per frame (1/"fps"), often called delta time. Instead of using "1 over fps," we use the symbol Δtime (delta time), where delta means "change." This scales the velocity so the movement is consistent regardless of the frame rate.

So the core formula becomes:

#frame[$
"position" = "position" + ("velocity" * Delta"time");
$]

This formula covers a huge amount of basic physics you need for games. If you add acceleration, you get:

#frame[$
"velocity" = "velocity" + ("acceleration" * Delta"time");
$]

This takes you even further into physics simulations.
More advanced topics, like multiplayer synchronization, require additional tricks such as splitting velocity updates before and after certain calculations, but that's beyond today's scope.

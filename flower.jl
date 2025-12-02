using Plots  # Load the Plots package to create charts and graphs

# Create a list of angles from 0 to 2π to draw the flower petals smoothly
θ = range(0, 2π, length=1500)

# List of colors for each layer of petals
colors = [:magenta, :orange, :pink, :red]

# Start a new blank plot with no legend or axes, square shape, white background
p = plot(legend=false, axis=false, size=(700,700), aspect_ratio=1, background_color=:white)

# Loop through each color and its index to draw petal layers
for (i, c) in enumerate(colors)
    k = 6 + (i-1)           # Number of petals changes with each layer (6, 7, 8, 9)
    scale = 0.6 + 0.15*(i-1)  # Size of petals increases for each layer

    # Calculate how far each petal point is from the center (radius)
    r = scale .* (sin.(k .* θ) .^ 2) .* (1 .+ 0.25*cos.(3 .* θ))

    # Convert polar coordinates (r, θ) to x and y positions
    x = r .* cos.(θ)
    y = r .* sin.(θ)

    # Add this layer of petals to the plot with the chosen color and thickness
    plot!(p, x, y, linewidth=3 + i, color=c, alpha=0.9)
end

# Add a yellow circle in the center of the flower
scatter!(p, [0], [0], markersize=40, color=:yellow, markerstrokecolor=:gold, markerstrokewidth=1.5)

# Show the flower plot on screen
display(p)

# Save the flower as an image file named "flower.png"
savefig(p, "flower.png")

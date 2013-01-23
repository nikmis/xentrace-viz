void drawLineChart(float v_hue, float[] temp, float[] data, int nth_histogram)
{
  hover_flag = 0;
  int i;
  int j = graphs_start_x;

  // draw graph lines
  drawGraphLines(nth_histogram);

  for (i = (int)(begin_f+slide);  (i < (int)(end_f+slide)) && (i < data_size - 1); i++, j+=bar_width)
  {
    // draw bars
    stroke(v_hue, 255, 200);
    fill(v_hue, 255, 200);

    // x - axis
    line(graphs_start_x+2, nth_histogram*(height - slider_height - r_slider_y)/num_histograms, width, nth_histogram*(height - slider_height - r_slider_y)/num_histograms);
    // y axis
    line(graphs_start_x+2, nth_histogram*(height - slider_height - r_slider_y)/num_histograms, graphs_start_x+2, 
    (nth_histogram-1)*(height - slider_height - r_slider_y)/num_histograms + slider_height + r_slider_y);

    ellipse(j + bar_width/2, nth_histogram*(height - slider_height - r_slider_y)/num_histograms - temp[i], 3, 3);

    line(j + bar_width/2, nth_histogram*(height - slider_height - r_slider_y)/num_histograms - temp[i], 
    j + bar_width + bar_width/2, nth_histogram*(height - slider_height - r_slider_y)/num_histograms - temp[i+1]);

    stroke(255);
    fill(255);
    // Redraw bar with border when hovering
    if (ruler_button_enable == 1)
    {
      drawHoverCircle(v_hue, temp, nth_histogram, i, j);
      drawRulerBarValues(v_hue, data, nth_histogram, i, j);
    }
  }
  
  
  // Display bar iteration
  fill(255);
  //stroke(0);
  noStroke();
  rect(graphs_start_x, height - slider_height - r_slider_y + textAscent() + textDescent() - 3, 2*textWidth(Integer.toString((int)(begin_f+slide))), (textAscent() + textDescent()) + 4);
  rect(width - 2*textWidth(Integer.toString(i-1)), height - slider_height - r_slider_y + textAscent() + textDescent() - 3, 2*textWidth(Integer.toString((int)(i-1))), (textAscent() + textDescent()) + 4);
  
  fill(0);
  textFont(font);
  text(Integer.toString((int)(begin_f+slide)), graphs_start_x, height - slider_height - r_slider_y + textAscent() + 2*textDescent(), LEFT);
  text(Integer.toString(i-1), width - textWidth(Integer.toString(i)), height - slider_height - r_slider_y + textAscent()+ 2*textDescent(), RIGHT);
  
  stroke(255);
  fill(255);
}


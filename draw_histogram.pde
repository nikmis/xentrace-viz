//==================================drawHistogram()===============================
void drawHistogram(float v_hue, float[] temp, float[] data, int nth_histogram)
{
  hover_flag = 0;
  int i;
  int j = graphs_start_x;

  // draw graph lines
  drawGraphLines(nth_histogram);

  for (i = (int)(begin_f+slide);  (i < (int)(end_f+slide)) && (i < data_size); i++, j+=bar_width)
  {

    // draw bars
    fill(v_hue, temp[i]*(num_histograms/1.99), temp[i]*(num_histograms/1.5));

    rect(j, nth_histogram*(height - slider_height - r_slider_y)/num_histograms, bar_width, -temp[i]);


    // Redraw bar with border when hovering
    if (ruler_button_enable == 1)
    {
      drawHoverBar(v_hue, temp, nth_histogram, i, j);
      drawRulerBarValues(v_hue, data, nth_histogram, i, j);
    }
  }

  // Display bar iteration
  fill(255);
  noStroke();
  rect(graphs_start_x, height - slider_height - r_slider_y + textAscent() + textDescent() - 3, 2*textWidth(Integer.toString((int)(begin_f+slide))), (textAscent() + textDescent()) + 4);
  rect(width - 2*textWidth(Integer.toString(i-1)), height - slider_height - r_slider_y + textAscent() + textDescent() - 3, 2*textWidth(Integer.toString((int)(i-1))), (textAscent() + textDescent()) + 4);
  
  fill(0);
  textFont(font);
  text(Integer.toString((int)(begin_f+slide)), graphs_start_x, height - slider_height - r_slider_y + textAscent() + 2*textDescent(), LEFT);
  text(Integer.toString(i-1), width - textWidth(Integer.toString(i)), height - slider_height - r_slider_y + textAscent() + 2*textDescent(), RIGHT);
  
}

//==================================updateNumHistograms()===============================
// NumHistograms represents the number of selected graphs at a any given time. It can be histograms
// or any other graph for practical purposes. Poorly chose name, so stuck with it.
void updateNumHistograms()
{
  int num_h = 0;
  for (int i = 1; i <= evs.get_num_events(); i++)
  {
    if (evs.get_flag(i) == 1) ++num_h;
  } 

  num_histograms = (num_h == 0) ? 1 : num_h;
}


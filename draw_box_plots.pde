//==================================drawBoxPlots()===============================
void drawBoxPlots(float v_hue, float[] temp, float[] actual_data, int nth_histogram)
{
  float low = 0, disp_low = 0, prev_disp_low = 0;
  float low_quart = 0, disp_low_quart = 0, prev_disp_low_quart = 0;
  float median = 0, disp_median = 0, prev_disp_median = 0;
  float high_quart = 0, disp_high_quart = 0, prev_disp_high_quart = 0;
  float high = 0, disp_high = 0, prev_disp_high = 0;

  float[] work_data = new float[box_bar_interval];
  float[] actual_work_data = new float[box_bar_interval];

  hover_flag = 0;
  int i;
  int j = graphs_start_x;

  // draw graph lines
  drawGraphLines(nth_histogram);

  for (i = (int)(begin_f+slide);  (i >= 0) && (i < data_size); i+=box_bar_interval, j+=bar_gap*box_bar_width)
  {
    stroke(v_hue, 255, 200);
    fill(v_hue, 255, 200, 30);

    if ((i+box_bar_interval) < data_size)
    { 
      arrayCopy(temp, i, work_data, 0, box_bar_interval);
      arrayCopy(actual_data, i, actual_work_data, 0, box_bar_interval);
    }
    else
    {
      arrayCopy(temp, i, work_data, 0, data_size - i);
      arrayCopy(actual_data, i, actual_work_data, 0, data_size - i);
    }

    work_data = sort(work_data);
    actual_work_data = sort(actual_work_data);


    // Save previous values
    prev_disp_low = disp_low;
    prev_disp_high = disp_high;
    prev_disp_median = disp_median;

    prev_disp_low_quart = disp_low_quart;
    prev_disp_high_quart = disp_high_quart;

    // Calc display pixel values.
    disp_low = work_data[0];
    disp_high = work_data[box_bar_interval - 1];
    disp_median = calcMedian(work_data);

    disp_low_quart = calcLowQuart(work_data);
    disp_high_quart = calcHighQuart(work_data);

    // Calc new box values
    low = actual_work_data[0];
    high = actual_work_data[box_bar_interval - 1];
    median = calcMedian(actual_work_data);

    low_quart = calcLowQuart(actual_work_data);
    high_quart = calcHighQuart(actual_work_data);

    // x - axis
    line(graphs_start_x+2, nth_histogram*(height - slider_height - r_slider_y)/num_histograms, width, nth_histogram*(height - slider_height - r_slider_y)/num_histograms);
    // y axis
    line(graphs_start_x+2, nth_histogram*(height - slider_height - r_slider_y)/num_histograms, graphs_start_x+2, 
    (nth_histogram-1)*(height - slider_height - r_slider_y)/num_histograms + slider_height + r_slider_y);

    // Box
    rect(j+box_bar_width, nth_histogram*(height - slider_height - r_slider_y)/num_histograms - disp_low_quart, 
    box_bar_width, -(disp_high_quart - disp_low_quart));

    // Median line
    strokeWeight(2);
    line(j+box_bar_width, nth_histogram*(height - slider_height - r_slider_y)/num_histograms - disp_median, 
    (j+box_bar_width) + box_bar_width, nth_histogram*(height - slider_height - r_slider_y)/num_histograms - disp_median);

    strokeWeight(1);

    // Low
    stroke(10);
    line(j + box_bar_width + box_bar_width/2, nth_histogram*(height - slider_height - r_slider_y)/num_histograms - disp_low_quart, 
    j + box_bar_width + box_bar_width/2, nth_histogram*(height - slider_height - r_slider_y)/num_histograms - disp_low);
    line(j + box_bar_width + 3, nth_histogram*(height - slider_height - r_slider_y)/num_histograms - disp_low, 
    (j + box_bar_width) + box_bar_width - 3, nth_histogram*(height - slider_height - r_slider_y)/num_histograms - disp_low);

    // High
    stroke(10);
    line(j + box_bar_width + box_bar_width/2, nth_histogram*(height - slider_height - r_slider_y)/num_histograms - disp_high_quart, 
    j + box_bar_width + box_bar_width/2, nth_histogram*(height - slider_height - r_slider_y)/num_histograms - disp_high);
    line(j + box_bar_width + 3, nth_histogram*(height - slider_height - r_slider_y)/num_histograms - disp_high, 
    (j + box_bar_width) + box_bar_width - 3, nth_histogram*(height - slider_height - r_slider_y)/num_histograms - disp_high);

    // Redraw bar with border when hovering
    if (ruler_button_enable == 1)
    {
      drawHoverBoxBar(v_hue, nth_histogram, i, j, prev_disp_low_quart, prev_disp_high_quart);
      drawRulerBoxBarValues(v_hue, nth_histogram, i, j+box_bar_width, low, high, median, low_quart, high_quart);
    }
  }
  
  // Display bar iteration at the start and end of screen. 
  int box_bar_iter = (width - graphs_start_x)/(bar_gap*box_bar_width);
  box_bar_iter = (int)(box_bar_iter + slide/box_bar_interval);
  box_bar_iter = box_bar_iter*box_bar_interval + box_bar_interval;
  
  if(box_bar_iter > data_size)
  {
    box_bar_iter = data_size;
  }
    textFont(font);
    
  fill(255);
  noStroke();
  rect(graphs_start_x, height - slider_height - r_slider_y + textAscent() + 2*textDescent(), textWidth(Integer.toString((int)(begin_f+slide))), -(textAscent() + textDescent()));
  rect(width - textWidth(Integer.toString(i)), height - slider_height - r_slider_y + textAscent() + 2*textDescent(), textWidth(Integer.toString((int)box_bar_iter)), -(textAscent() + textDescent()));
  
  fill(0);
  text(Integer.toString((int)(begin_f+slide)), graphs_start_x, height - slider_height - r_slider_y + textAscent() + textDescent(), LEFT);
  text(Integer.toString((int)box_bar_iter), width - textWidth(Integer.toString(i)), height - slider_height - r_slider_y + textAscent() + textDescent(), RIGHT);
  
}

float calcMedian(float[] a)
{
  float median = 0;

  if ((a.length % 2) == 0)
  {
    median = (a[a.length/2] + a[a.length/2 + 1])/2;
  }
  else
  {
    median = a[a.length/2];
  }

  return median;
}

float calcLowQuart(float[] a)
{
  float[] a_low = new float[a.length/2];
  int high_index = a.length/2;

  arrayCopy(a, 0, a_low, 0, a_low.length);

  return calcMedian(a_low);
}

float calcHighQuart(float[] a)
{
  float[] a_high = new float[a.length/2];
  int low_index; 

  if ((a.length % 2) == 0)
  {
    low_index = a.length/2;
  }
  else
  {
    low_index = a.length/2 + 1;
  }

  arrayCopy(a, low_index, a_high, 0, a_high.length);

  return calcMedian(a_high);
}


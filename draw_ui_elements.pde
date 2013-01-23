//==================================drawSliderButtons()================================
void drawSliderButtons()
{
  // Draw rect
  if (r_slider_flag == 1)
  {
    if(box_plot_button_enable == 1)
    {
      stroke(#22C902);
      fill(#22C902);
    }
    else
    {
      stroke(#006BFC);
      fill(#006BFC);
    }
  }
  else
  {
    if(box_plot_button_enable == 1)
    {
      stroke(#D3F0CE);
      fill(#D3F0CE);
    }
    else
    {
      stroke(#D1E4FF);
      fill(#D1E4FF);
    }
  }

  // Right slider
  rect(r_slider_x, r_slider_y, slider_width, slider_height);
  
  // Draw arrow
  if (r_slider_flag == 1)
  {
    if(box_plot_button_enable == 1)
    {
      stroke(#D3F0CE);
      fill(#D3F0CE);     
    }
    else
    {
      stroke(#D1E4FF);
      fill(#D1E4FF);
    }
  }
  else
  {
    if(box_plot_button_enable == 1)
    {
      // dark green
      stroke(#22C902);
      fill(#22C902);
    }
    else
    {
       // dark blue
      stroke(#006BFC);
      fill(#006BFC); 
    }
  }
  noStroke();
  beginShape();
  smooth();
  vertex(r_slider_x + slider_width/2 - slider_width/8 + 4, r_slider_y + slider_height/2);
  vertex(r_slider_x + slider_width/4 + slider_width/8 + 4, r_slider_y + slider_height - 4);
  vertex(r_slider_x + slider_width/2 + slider_width/8 + 4, r_slider_y + slider_height/2);
  vertex(r_slider_x + slider_width/4 + slider_width/8 + 4, r_slider_y + 4);
  endShape(CLOSE);

  if (l_slider_flag == 1)
  {
   if(box_plot_button_enable == 1)
    {
      stroke(#22C902);
      fill(#22C902);
    }
    else
    {
      stroke(#006BFC);
      fill(#006BFC);
    }
  }
  else
  {
    if(box_plot_button_enable == 1)
    {
      stroke(#D3F0CE);
      fill(#D3F0CE);
    }
    else
    {
      stroke(#D1E4FF);
      fill(#D1E4FF);
    }
  }

  // Left silider
  rect(l_slider_x, l_slider_y, slider_width, slider_height);

  // Draw arrow
  if (l_slider_flag == 1)
  {
    if(box_plot_button_enable == 1)
    {
      stroke(#D3F0CE);
      fill(#D3F0CE);     
    }
    else
    {
      stroke(#D1E4FF);
      fill(#D1E4FF);
    }
  }
  else
  {
    if(box_plot_button_enable == 1)
    {
      // dark green
      stroke(#22C902);
      fill(#22C902);
    }
    else
    {
       // dark blue
      stroke(#006BFC);
      fill(#006BFC); 
    }
  }
  noStroke();
  beginShape();
  smooth();
  vertex(l_slider_x + slider_width/2 + slider_width/8 - 4, l_slider_y + slider_height/2);
  vertex(l_slider_x + 3*slider_width/4 -slider_width/8 - 3, l_slider_y + slider_height - 4);
  vertex(l_slider_x + slider_width/2 - slider_width/8 - 3, l_slider_y + slider_height/2);
  vertex(l_slider_x + 3*slider_width/4 - slider_width/8 - 3, l_slider_y + 4);
  endShape(CLOSE);
  stroke(255);
}

//==================================checkRightMouseSlider()=============================
void checkRightMouseSlider()
{
  if ((mouseX > r_slider_x) && (mouseX < r_slider_x + slider_width) && (mouseY > r_slider_y) && (mouseY < r_slider_y + slider_height) && (end_f+slide < end))
  {
    if(box_plot_button_enable == 1)
    {
      slide += box_bar_interval;
    }
    else
    {
      slide += 1;
    }
    
    r_slider_flag = 1;
  }
  else
  {
    r_slider_flag = 0;
  }
}

//==================================checkLeftMouseSlider()=============================
void checkLeftMouseSlider()
{
  if ((mouseX > l_slider_x) && (mouseX < l_slider_x + slider_width) && (mouseY > l_slider_y) && (mouseY < l_slider_y + slider_height) && (begin_f+slide > start))
  { 
    if(box_plot_button_enable == 1)
    {
      slide -= box_bar_interval;
    }
    else
    {
      slide -= 1;
    }

    l_slider_flag = 1;
  }
  else
  {
    l_slider_flag = 0;
  }
}

//==================================drawRulerButton()==================================
void drawRulerButton()
{
  String e = "Enable Ruler", d = "Disable Ruler";

  if (ruler_button_enable == 1)
  {
    if(box_plot_button_enable == 1)
    {
      stroke(#22C902);
      fill(#22C902);
    }
    else
    {
      stroke(#006BFC);
      fill(#006BFC);
    }
  }
  else
  {
    if(box_plot_button_enable == 1)
    {
      stroke(#D3F0CE);
      fill(#D3F0CE);
    }
    else
    {
      stroke(#D1E4FF);
      fill(#D1E4FF);
    }
  }

  rect(ruler_button_x, ruler_button_y, ruler_button_width, ruler_button_height); 

  textFont(ev_font);
  if (ruler_button_enable == 1)
  {
    if(box_plot_button_enable == 1)
    {
      fill(#D3F0CE);
    }
    else
    {
      fill(#D1E4FF);
    }
    text(d, ruler_button_x + (ruler_button_width - textWidth(d))/2, ruler_button_y + ruler_button_height/2 + textAscent()/3.5);
  }
  else
  {
    if(box_plot_button_enable == 1)
    {
      fill(#22C902);
    }
    else
    {
      fill(#006BFC);
    }
    text(e, ruler_button_x + (ruler_button_width - textWidth(e))/2, ruler_button_y + ruler_button_height/2 + textAscent()/3.5);
  }

  mouseHoveringRulerButton();

  fill(255);
  stroke(255);
}

//==================================drawRuler()========================================
void drawRuler()
{
  if ((ruler_button_enable == 1) && ((r_slider_flag | l_slider_flag) == 0) && (!mouse_on_scrollbar))
  {
    stroke(150);
    if (mouseX > graphs_start_x)
    {
      line(mouseX, 0, mouseX, height);
    }
    stroke(255);
  }
}

//==================================drawEventButtons()=================================
void drawEventButtons(Events e)
{
  for (int i = 1; i <= e.get_num_events(); i++)
  {
    smooth();
    drawCircleButtons(ev_button_x, ev_button_y, i);

    // Draw rects
    fill(e.get_hue(i), 180, 255);
    rect(ev_button_x, ev_button_y + (i-1)*ev_button_height, ev_button_width, ev_button_height); 

    // Draw event names
    textFont(ev_font);
    fill(0);
    text(e.get_ev_name(i), ev_button_x + 3, ev_button_y + (i)*ev_button_height - (textAscent() + textDescent())/3);
  }
}

//==================================drawScroller()=====================================
void drawScroller()
{
  float x = 0;
  float scroll_bar_len_ratio = 0;
//  float new_end_f = (width - graphs_start_x)/bar_gap;
  
  // Slider line for Scroll bars
  start_line_x = l_slider_x + slider_width + 5;
  start_line_y = l_slider_y + slider_height/2;
  end_line_x = r_slider_x - 5;
  end_line_y = r_slider_y + slider_height/2;

  stroke(200);
  line(start_line_x, start_line_y, end_line_x, end_line_y);
  stroke(255);

  scroll_line_length = end_line_x - start_line_x;

  scroll_bar_len_ratio = (end_f - start)/(end - start);
  
  // Scroll bar scroller
  if(scroll_bar_len_ratio <= 1)
  {
    scroll_bar_length = scroll_bar_len_ratio*scroll_line_length;
  }
  else
  {
    scroll_bar_length = scroll_line_length; 
  }
  
  start_bar_x = start_line_x;
  bar_y = start_line_y - scroll_bar_height/2;

  // Calculate scroll for scroll bar based on slide value

  if (mousePressed == false)
  {
    scroll_slide_len = slide*(scroll_bar_length/end_f);
  }

  // Check if mouse points to scroll bar or is being dragged
  if ((mouse_on_scrollbar) || ((mouseX >= start_line_x + scroll_slide_len) && (mouseX <= start_line_x + scroll_slide_len + scroll_bar_length) && 
    (mouseY >= bar_y - 2) && (mouseY <= bar_y + scroll_bar_height + 2)))
  {
    if(box_plot_button_enable == 1)
    {
      stroke(#22C902);
      fill(#22C902);
    }
    else
    {
      stroke(#006BFC);
      fill(#006BFC);
    }
  }
  else
  {
    if(box_plot_button_enable == 1)
    {
      stroke(#D3F0CE);
      fill(#D3F0CE);
    }
    else
    {
      stroke(#D1E4FF);
      fill(#D1E4FF);
    }
  }

  end_bar_x = start_line_x + scroll_slide_len + scroll_bar_length;

  // if {} else {} : Prevent scroll bar to slide off screen
  if (end_bar_x <= end_line_x)
  {
    rect(start_line_x + scroll_slide_len, bar_y, scroll_bar_length, scroll_bar_height);
  }
  else
  {
    rect(start_line_x + scroll_line_length  - scroll_bar_length, bar_y, scroll_bar_length, scroll_bar_height);
  }

  stroke(255);
  fill(255);
}

//==================================drawCircleButtons()===============================
void drawCircleButtons(int x, int y, int count)
{
  float center_x, center_y, rad;

  center_x = x + ev_button_width + ev_button_height/2 + 2;
  center_y = y + (count-1)*ev_button_height + ev_button_height/2;
  rad = ev_button_height/2;

  // Check if already clicked
  // Clicked so draw dark circle
  if (evs.get_flag(count) == 1)
  {
    stroke(#D1E4FF);
    fill(#D1E4FF);    
    ellipse(center_x, center_y, rad+1, rad+1);
    fill(#006BFC);
    ellipse(center_x, center_y, rad-4, rad-4);
    fill(255);
    stroke(255);
  }
  else //  not clicked, so draw empty circle
  { 
    if (mouseHoveringCircleButton(center_x, center_y, rad))
    {
      //stroke(#85A4CE);
      //stroke(#006BFC);
      fill(#006BFC);
    }
    else
    {
      stroke(#D1E4FF);
      fill(#D1E4FF);
    }
    ellipse(center_x, center_y, rad+1, rad+1);
    fill(255);
    stroke(255);
  }
}

//==================================drawRulerBarValues()===============================
void drawRulerBarValues(float v_hue, float[] temp, int nth_histogram, int i, int j)
{
  // Display bar value in hover mode
  if (((r_slider_flag | l_slider_flag) == 0) && (!mouse_on_scrollbar) && (mouseX > j) && (mouseX < j + bar_width))
  {
    hover_flag = 1;

    // Display bar value
    fill(v_hue, 255, 160);
    textFont(font);
    text(Float.toString(temp[i]), mouseX + 2, (nth_histogram)*(height - slider_height - r_slider_y)/num_histograms + 18);

    // Display bar iteration
    // Draw a localized background for making fonts smoother
    fill(255);
    
    rect(j, 0, textWidth(Integer.toString(i)), textAscent() + textDescent());
    fill(0);
    textFont(font);
    
    text(Integer.toString(i), j, r_slider_y - 5);
  }
}

//==================================drawRulerBoxBarValues()===============================
void drawRulerBoxBarValues(float v_hue, int nth_histogram, int i, int j, float low, float high, float median, float low_quart, float high_quart)
{
  // Display bar value in hover mode
  if (((r_slider_flag | l_slider_flag) == 0) && (!mouse_on_scrollbar) && (mouseX > j) && (mouseX < j + box_bar_width))
  {
    hover_flag = 1;

    // Display bar value
    fill(v_hue, 255, 160);
    textFont(font);
    text("high = " + Float.toString(high), mouseX + 2, (nth_histogram - 1)*(height - slider_height - r_slider_y)/num_histograms + 18);
    text("high_quart = " + Float.toString(high_quart), mouseX + 2, (nth_histogram - 1)*(height - slider_height - r_slider_y)/num_histograms + 18*2 + textAscent());
    text("median = " + Float.toString(median), mouseX + 2, (nth_histogram - 1)*(height - slider_height - r_slider_y)/num_histograms + 18*3 + textAscent());
    text("low_quart = " + Float.toString(low_quart), mouseX + 2, (nth_histogram - 1)*(height - slider_height - r_slider_y)/num_histograms + 18*4 + textAscent());
    text("low = " + Float.toString(low), mouseX + 2, (nth_histogram - 1)*(height - slider_height - r_slider_y)/num_histograms + 18*5 + textAscent());

    // Display bar iteration
    // Draw a localized background for making fonts smoother
    fill(255);
    noStroke();
    rect(j, (height - slider_height - r_slider_y) + 2, textWidth(Integer.toString(i)), textAscent() + textDescent() + 3);
    fill(0);
    textFont(font);
    
    text(Integer.toString(i+box_bar_interval), j, (height - slider_height - r_slider_y) + 20);
    stroke(255);
  }
}

//==================================drawHoverBar()======================================
void drawHoverBar(float v_hue, float[] temp, int nth_histogram, int i, int j)
{
  if (hover_flag == 1)
  { 
    stroke(hover_bar_color);

    if (histogram_button_enable == 1)
    {
      fill(v_hue, temp[i-1]*(num_histograms/1.99), temp[i-1]*(num_histograms/1.5));
    }
    else if (histogram_no_color_button_enable == 1)
    {
      fill(v_hue, 255, 255);
    }
    // Draw hover bar again after successive bar is done, to overwrite bar border.
    rect((j-bar_width), nth_histogram*(height - slider_height - r_slider_y)/num_histograms, bar_width, -temp[i-1]);
    stroke(255);

    hover_flag = 0;
  }
}

//==================================drawHoverBoxBar()===============================
void drawHoverBoxBar(float v_hue, int nth_histogram, int i, int j, float disp_low_quart, float disp_high_quart)
{
  if (hover_flag == 1)
  { 
    stroke(v_hue, 255, 200);

    fill(v_hue, 255, 200, 60);
    
    // Draw hover bar again after successive bar is done, to overwrite bar border.
    rect(j - bar_gap*box_bar_width + box_bar_width, nth_histogram*(height - slider_height - r_slider_y)/num_histograms - disp_low_quart, 
         box_bar_width, -(disp_high_quart - disp_low_quart));

    stroke(255);

    hover_flag = 0;
  }
}

//==================================drawHoverCircle()===============================
void drawHoverCircle(float v_hue, float[] temp, int nth_histogram, int i, int j)
{
  if (hover_flag == 1)
  { 
    stroke(v_hue, 255, 150);

    fill(v_hue, 255, 150);
    ellipse(j - bar_width + bar_width/2, nth_histogram*(height - slider_height - r_slider_y)/num_histograms - temp[i-1], 7, 7);
    stroke(255);

    hover_flag = 0;
  }
}

//==================================drawZoomButtons()===============================
void drawZoomButtons()
{
  String plus = "+", minus = "-";

  textFont(ev_font);
  if (zoom_button_plus_enable == 1)
  {
    //stroke(#006BFC);
    stroke(255);
    if(box_plot_button_enable == 1)
    {
      fill(#22C902);
    }
    else
    {
      fill(#006BFC);
    }
    // + button
    rect(zoom_button_x, zoom_button_y, zoom_button_width, zoom_button_height); 
    if(box_plot_button_enable == 1)
    {
      fill(#D3F0CE);
    }
    else
    {
      fill(#D1E4FF);
    }
    
    text(plus, zoom_button_x + (zoom_button_width - textWidth(plus))/2, zoom_button_y + zoom_button_height/2 + textAscent()/3.5);
  }
  else
  {
    //stroke(#D1E4FF);
    stroke(255);
    if(box_plot_button_enable == 1)
    {
      fill(#D3F0CE);
    }
    else
    {
      fill(#D1E4FF);
    }
    
    rect(zoom_button_x, zoom_button_y, zoom_button_width, zoom_button_height); 
    if(box_plot_button_enable == 1)
    {
      fill(#22C902);
    }
    else
    {
      fill(#006BFC);
    }
    
    text(plus, zoom_button_x + (zoom_button_width - textWidth(plus))/2, zoom_button_y + zoom_button_height/2 + textAscent()/3.5);
  }

  if (zoom_button_minus_enable == 1)
  {
    // stroke(#006BFC);
    stroke(255);
    if(box_plot_button_enable == 1)
    {
      fill(#22C902);
    }
    else
    {
      fill(#006BFC);
    }
    
    // - button
    rect(zoom_button_x + zoom_button_width, zoom_button_y, zoom_button_width, zoom_button_height); 
    if(box_plot_button_enable == 1)
    {
      fill(#D3F0CE);
    }
    else
    {
      fill(#D1E4FF);
    }

    text(minus, zoom_button_x + zoom_button_width + (zoom_button_width - textWidth(minus))/2, zoom_button_y + zoom_button_height/2 + textAscent()/3.5);
  }
  else
  {
    //stroke(#D1E4FF);
    stroke(255);
    if(box_plot_button_enable == 1)
    {
      fill(#D3F0CE);
    }
    else
    {
      fill(#D1E4FF);
    }
    
    rect(zoom_button_x + zoom_button_width, zoom_button_y, zoom_button_width, zoom_button_height); 
    if(box_plot_button_enable == 1)
    {
      fill(#22C902);
    }
    else
    {
      fill(#006BFC);
    }

    text(minus, zoom_button_x + zoom_button_width + (zoom_button_width - textWidth(minus))/2, zoom_button_y + zoom_button_height/2 + textAscent()/3.5);
  }

  //mouseHoveringzoomButton();

  fill(255);
  stroke(255);
}

//==================================drawLineChartButton()===============================
void drawLineChartButton()
{
  String line_chart = "Line Chart";

  if (line_chart_button_enable == 1)
  {
    stroke(#006BFC);
    fill(#006BFC);
  }
  else
  {
    stroke(#D1E4FF);
    fill(#D1E4FF);
  }

  rect(line_chart_button_x, line_chart_button_y, line_chart_button_width, line_chart_button_height); 

  textFont(ev_font);
  if (line_chart_button_enable == 1)
  {
    fill(#D1E4FF);
    text(line_chart, line_chart_button_x + (line_chart_button_width - textWidth(line_chart))/2, line_chart_button_y + line_chart_button_height/2 + textAscent()/3.5);
  }
  else
  {
    fill(#006BFC);
    text(line_chart, line_chart_button_x + (line_chart_button_width - textWidth(line_chart))/2, line_chart_button_y + line_chart_button_height/2 + textAscent()/3.5);
  }

  // mouseHoveringline_chartButton();

  fill(255);
  stroke(255);
}

//==================================drawLineChartAreaButton()===============================
void drawLineChartAreaButton()
{
  String line_chart_area = "Line Chart (area)";

  if (line_chart_area_button_enable == 1)
  {
    stroke(#006BFC);
    fill(#006BFC);
  }
  else
  {
    stroke(#D1E4FF);
    fill(#D1E4FF);
  }

  rect(line_chart_area_button_x, line_chart_area_button_y, line_chart_area_button_width, line_chart_area_button_height); 

  textFont(ev_font);
  if (line_chart_area_button_enable == 1)
  {
    fill(#D1E4FF);
    text(line_chart_area, line_chart_area_button_x + (line_chart_area_button_width - textWidth(line_chart_area))/2, line_chart_area_button_y + line_chart_area_button_height/2 + textAscent()/3.5);
  }
  else
  {
    fill(#006BFC);
    text(line_chart_area, line_chart_area_button_x + (line_chart_area_button_width - textWidth(line_chart_area))/2, line_chart_area_button_y + line_chart_area_button_height/2 + textAscent()/3.5);
  }

  // mouseHoveringline_chart_areaButton();

  fill(255);
  stroke(255);
}

//==================================drawHistogramButton()===============================
void drawHistogramButton()
{
  String hist = "Histogram (C)";

  if (histogram_button_enable == 1)
  {
    stroke(#006BFC);
    fill(#006BFC);
  }
  else
  {
    stroke(#D1E4FF);
    fill(#D1E4FF);
  }

  rect(histogram_button_x, histogram_button_y, histogram_button_width, histogram_button_height); 

  textFont(ev_font);
  if (histogram_button_enable == 1)
  {
    fill(#D1E4FF);
    text(hist, histogram_button_x + (histogram_button_width - textWidth(hist))/2, histogram_button_y + histogram_button_height/2 + textAscent()/3.5);
  }
  else
  {
    fill(#006BFC);
    text(hist, histogram_button_x + (histogram_button_width - textWidth(hist))/2, histogram_button_y + histogram_button_height/2 + textAscent()/3.5);
  }

  // mouseHoveringhistogramButton();

  fill(255);
  stroke(255);
}

//==================================drawHistogramNoColorButton()===============================
void drawHistogramNoColorButton()
{
  String hist = "Histogram (no C)";

  if (histogram_no_color_button_enable == 1)
  {
    stroke(#006BFC);
    fill(#006BFC);
  }
  else
  {
    stroke(#D1E4FF);
    fill(#D1E4FF);
  }

  rect(histogram_no_color_button_x, histogram_no_color_button_y, histogram_no_color_button_width, histogram_no_color_button_height); 

  textFont(ev_font);
  if (histogram_no_color_button_enable == 1)
  {
    fill(#D1E4FF);
    text(hist, histogram_no_color_button_x + (histogram_no_color_button_width - textWidth(hist))/2, histogram_no_color_button_y + histogram_no_color_button_height/2 + textAscent()/3.5);
  }
  else
  {
    fill(#006BFC);
    text(hist, histogram_no_color_button_x + (histogram_no_color_button_width - textWidth(hist))/2, histogram_no_color_button_y + histogram_no_color_button_height/2 + textAscent()/3.5);
  }

  // mouseHoveringhistogram_no_colorButton();

  fill(255);
  stroke(255);
}


//==================================drawBoxPlotButton()===============================
void drawBoxPlotButton()
{
  String hist = "Summary";

  if (box_plot_button_enable == 1)
  {
    stroke(#22C902);
    fill(#22C902);
  }
  else
  {
    stroke(#D3F0CE);
    fill(#D3F0CE);
  }

  rect(box_plot_button_x, box_plot_button_y, box_plot_button_width, box_plot_button_height); 

  textFont(ev_font);
  if (box_plot_button_enable == 1)
  {
    fill(#D3F0CE);
    text(hist, box_plot_button_x + (box_plot_button_width - textWidth(hist))/2, box_plot_button_y + box_plot_button_height/2 + textAscent()/3.5);
  }
  else
  {
    fill(#22C902);
    text(hist, box_plot_button_x + (box_plot_button_width - textWidth(hist))/2, box_plot_button_y + box_plot_button_height/2 + textAscent()/3.5);
  }

  // mouseHoveringbox_plotButton();

  fill(255);
  stroke(255);
}

//==================================drawGraphLines()===============================
void drawGraphLines(int nth_histogram)
{
  float max_data = evs.calculate_max_data(1);
  
  for(int i = 100; i < max_data; i+=100)
  {
     // Lengh of y-axis, formula from line chart
     float val = map(i, 0, max_data, 0, (height - slider_height - r_slider_y)/num_histograms - slider_height - r_slider_y); 
    // println(" " + max_data + " " + val); 
     stroke(200);    
     line(graphs_start_x, nth_histogram*(height - slider_height - r_slider_y)/num_histograms - val, width, nth_histogram*(height - slider_height - r_slider_y)/num_histograms - val);
     
     textFont(graph_line_font);
     fill(255);
     noStroke();
     rect(graphs_start_x-1, nth_histogram*(height - slider_height - r_slider_y)/num_histograms - val - 1, textWidth(Integer.toString(i))/2, textAscent());
     fill(150);
     text(Integer.toString(i), graphs_start_x - textWidth(Integer.toString(i)), nth_histogram*(height - slider_height - r_slider_y)/num_histograms - val, CENTER);
  }
  stroke(255);
}

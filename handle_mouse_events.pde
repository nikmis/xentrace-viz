//==================================mouseDragged()===============================
void mouseDragged()
{
  if (mouse_on_scrollbar)
  {
    if (((mouseX + scroll_diff - scroll_bar_length) > start_line_x) && (mouseX + scroll_diff < end_line_x))
    {
      scroll_slide_len = mouseX + scroll_diff - start_line_x - scroll_bar_length;
      slide = abs(scroll_slide_len)*end_f/scroll_bar_length;

      // Align slide to box_bar_width to always get right median and other box values.
      if (box_plot_button_enable == 1)
      {
        slide = ((int)(slide/box_bar_interval))*box_bar_interval;
      }
    }
    //cursor(HAND);
  }
}

//==================================mousePressed()===============================
void mousePressed()
{
  if ((mouseX >= start_line_x + scroll_slide_len) && (mouseX <= start_line_x + scroll_slide_len + scroll_bar_length) && 
    (mouseY >= bar_y - 2) && (mouseY <= bar_y + scroll_bar_height + 2))    
  {
    scroll_diff = (start_line_x + scroll_slide_len + scroll_bar_length) - mouseX; 
    mouse_on_scrollbar = true;
  }

  // Zoom buttons
  if ((mouseX >= zoom_button_x) && (mouseX <= zoom_button_x + zoom_button_width) &&
    (mouseY >= zoom_button_y) && (mouseY <= zoom_button_y + zoom_button_height))
  {
    zoom_button_plus_enable = 1;
    if (box_plot_button_enable == 1)
    {
      if (box_bar_interval < end)
      {
        box_bar_interval += 10;
      }
    }
    else
    {
      if (bar_width < 50)
      {
        bar_width += 1;
      }
    }
  }
  else
  {
    zoom_button_plus_enable = 0;
  }

  if ((mouseX >= zoom_button_x + zoom_button_width) && (mouseX <= zoom_button_x + 2*zoom_button_width) &&
    (mouseY >= zoom_button_y) && (mouseY <= zoom_button_y + zoom_button_height))
  {
    zoom_button_minus_enable = 1;
    if (box_plot_button_enable == 1)
    {
      if (box_bar_interval > 10)
      {
        box_bar_interval -= 10;
      }
    }
    else
    {
      if (bar_width > 4)
      {
        bar_width -= 1;
      }
    }
  }
  else
  {
    zoom_button_minus_enable = 0;
  }
}

//==================================mouseReleased()===============================
void mouseReleased()
{
  scroll_diff = 0;
  mouse_on_scrollbar = false;

  zoom_button_plus_enable = 0;
  zoom_button_minus_enable = 0;
}

//==================================mouseClicked()===============================
void mouseClicked()
{
  float center_x, center_y, rad;

  // drawEventButtons()
  // Check if event buttons were clicked
  for (int count = 1; count <= evs.get_num_events(); count++)
  {
    center_x = ev_button_x + ev_button_width + ev_button_height/2 + 2;
    center_y = ev_button_y + (count-1)*ev_button_height + ev_button_height/2;
    rad = ev_button_height/2;

    // Check if button pressed
    if (dist(mouseX, mouseY, center_x, center_y) < rad)
    { 
      // Flag set, button presssed
      if (evs.get_flag(count) == 1)
      {
        // reset flag
        evs.set_flag(count, 0);
        //println("Flag clear for " + Integer.toString(count));
      }
      else
      {
        // set flag
        evs.set_flag(count, 1);
        // println("Flag set for " + Integer.toString(count));
      }

      updateNumHistograms();
      evs.recalibrate_data();
    }
  }

  // drawRuler()
  // Check if ruler enable button was clicked
  if ((mouseX >= ruler_button_x) && (mouseX <= ruler_button_x + ruler_button_width) &&
    (mouseY >= ruler_button_y) && (mouseY <= ruler_button_y + ruler_button_height))
  {
    if (ruler_button_enable == 1)
    {
      ruler_button_enable = 0;
    }
    else
    {
      ruler_button_enable = 1;
    }
  }

  // drawLineChartButton()
  // Check if line_chart enable button was clicked
  if ((mouseX >= line_chart_button_x) && (mouseX <= line_chart_button_x + line_chart_button_width) &&
    (mouseY >= line_chart_button_y) && (mouseY <= line_chart_button_y + line_chart_button_height))
  {
    if (line_chart_button_enable == 1)
    {
      line_chart_button_enable = 0;
    }
    else
    {
      line_chart_button_enable = 1;
      box_plot_button_enable = 0;
      line_chart_area_button_enable = 0;
      histogram_no_color_button_enable = 0;
      histogram_button_enable = 0;
    }
  }

  // drawLineChartAreaButton()
  // Check if line_chart_area enable button was clicked
  if ((mouseX >= line_chart_area_button_x) && (mouseX <= line_chart_area_button_x + line_chart_area_button_width) &&
    (mouseY >= line_chart_area_button_y) && (mouseY <= line_chart_area_button_y + line_chart_area_button_height))
  {
    if (line_chart_area_button_enable == 1)
    {
      line_chart_area_button_enable = 0;
    }
    else
    {
      line_chart_area_button_enable = 1;
      box_plot_button_enable = 0;
      line_chart_button_enable = 0;
      histogram_no_color_button_enable = 0;
      histogram_button_enable = 0;
    }
  }

  // drawHistogramButton()
  // Check if line_chart enable button was clicked
  if ((mouseX >= histogram_button_x) && (mouseX <= histogram_button_x + histogram_button_width) &&
    (mouseY >= histogram_button_y) && (mouseY <= histogram_button_y + histogram_button_height))
  {
    if (histogram_button_enable == 1)
    {
      histogram_button_enable = 0;
    }
    else
    {
      histogram_button_enable = 1;
      box_plot_button_enable = 0;
      histogram_no_color_button_enable = 0;
      line_chart_button_enable = 0;
      line_chart_area_button_enable = 0;
    }
  }

  // drawHistogramNoColorButton()
  // Check if line_chart enable button was clicked
  if ((mouseX >= histogram_no_color_button_x) && (mouseX <= histogram_no_color_button_x + histogram_no_color_button_width) &&
    (mouseY >= histogram_no_color_button_y) && (mouseY <= histogram_no_color_button_y + histogram_no_color_button_height))
  {
    if (histogram_no_color_button_enable == 1)
    {
      histogram_no_color_button_enable = 0;
    }
    else
    {
      histogram_no_color_button_enable = 1;
      box_plot_button_enable = 0;
      histogram_button_enable = 0;
      line_chart_button_enable = 0;
      line_chart_area_button_enable = 0;
    }
  }

  // drawBoxPlotButton()
  // Check if box_plot enable button was clicked
  if ((mouseX >= box_plot_button_x) && (mouseX <= box_plot_button_x + box_plot_button_width) &&
    (mouseY >= box_plot_button_y) && (mouseY <= box_plot_button_y + box_plot_button_height))
  {
    slide = 0;

    if (box_plot_button_enable == 1)
    {
      box_plot_button_enable = 0;
    }
    else
    {
      box_plot_button_enable = 1;
      histogram_no_color_button_enable = 0;
      histogram_button_enable = 0;
      line_chart_button_enable = 0;
      line_chart_area_button_enable = 0;
    }
  }

  // drawScroller()
  // Scroll slide
  // Check if mouse clicked on scroll rectangle
  if ((mouseX >= start_line_x) && (mouseX <= end_line_x) && (mouseY >= bar_y - 5) && (mouseY <= bar_y + scroll_bar_height + 5))
  {
    scroll_clicked = 1;

    if ((mouseX - start_line_x) <= scroll_bar_length/2)
    {
      scroll_slide_len = 0;
    }
    else if ((end_line_x - mouseX) <= scroll_bar_length/2)
    {
      scroll_slide_len = scroll_line_length - scroll_bar_length;
    }
    else
    {
      scroll_slide_len = mouseX - start_bar_x - scroll_bar_length/2;
    }

    slide = abs(scroll_slide_len)*end_f/scroll_bar_length;

    if (box_plot_button_enable == 1)
    {
      slide = ((int)(slide/box_bar_interval))*box_bar_interval;
    }
  } 
  else
  {
    scroll_clicked = 0;
  }
  /*
   // Zoom buttons
   if ((mouseX >= zoom_button_x) && (mouseX <= zoom_button_x + zoom_button_width) &&
   (mouseY >= zoom_button_y) && (mouseY <= zoom_button_y + zoom_button_height))
   {
   zoom_button_plus_enable = 1;
   }
   else
   {
   zoom_button_plus_enable = 0;
   }
   
   if ((mouseX >= zoom_button_x + zoom_button_width) && (mouseX <= zoom_button_x + 2*zoom_button_width) &&
   (mouseY >= zoom_button_y) && (mouseY <= zoom_button_y + zoom_button_height))
   {
   zoom_button_minus_enable = 1;
   }
   else
   {
   zoom_button_minus_enable = 0;
   }
   */
}

//==================================mouseHoveringRulerButton()===============================
void mouseHoveringRulerButton()
{
  // Hover over Ruler button
  if ((mouseX >= ruler_button_x) && (mouseX <= ruler_button_x + ruler_button_width) &&
    (mouseY >= ruler_button_y) && (mouseY <= ruler_button_y + ruler_button_height))
  {
    cursor(HAND);
  }
  else
  {
    cursor(ARROW);
  }
}

//==================================mouseHoveringCircleButton()===============================
boolean mouseHoveringCircleButton(float center_x, float center_y, float rad)
{
  // Check if mouse hovering
  if (dist(mouseX, mouseY, center_x, center_y) < rad)
  {
    return true;
  }
  else
  {
    return false;
  }
}

// Zoom button
void mouseHoveringzoomButton()
{
}


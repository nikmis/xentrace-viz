int data_size = 600;
int originX = 170;
int graphs_start_x = originX + 10;

int mouse_clicked = 0;

int num_events = 6;
int num_histograms = 1;

int hover_flag = 0;
float hover_bar_color = 0;
int toggle_flag = 1;

float temp = 0;

// range 3 - 50
int bar_width = 10;
int box_bar_width = 10;
int box_bar_interval = 10;
int bar_gap = 5;
  
int start = 0, end = data_size;
float begin_f, end_f, slide;

int scroll_clicked = 0;
boolean mouse_on_scrollbar = false;

float scroll_slide_len = 0;
float scroll_bar_height = 10;
float scroll_bar_length = 0, scroll_line_length = 0;
float start_bar_x = 0, end_bar_x = 0, bar_y = 0;
float scroll_diff = 0;

int slider_width, slider_height;
int r_slider_x, r_slider_y;
int l_slider_x, l_slider_y;
int r_slider_flag, l_slider_flag;

float start_line_x = 0, start_line_y = 0;
float end_line_x = 0, end_line_y = 0;

int ev_button_x, ev_button_y;
int ev_button_width, ev_button_height;

int ruler_button_enable;
int ruler_button_x, ruler_button_y;
int ruler_button_width, ruler_button_height;

int ruler_dot_x;

int zoom_button_plus_enable, zoom_button_minus_enable;
int zoom_button_x, zoom_button_y;
int zoom_button_width, zoom_button_height;

int line_chart_button_enable;
int line_chart_button_x, line_chart_button_y;
int line_chart_button_width, line_chart_button_height;

int line_chart_area_button_enable;
int line_chart_area_button_x, line_chart_area_button_y;
int line_chart_area_button_width, line_chart_area_button_height;

int histogram_button_enable;
int histogram_button_x, histogram_button_y;
int histogram_button_width, histogram_button_height;


int histogram_no_color_button_enable;
int histogram_no_color_button_x, histogram_no_color_button_y;
int histogram_no_color_button_width, histogram_no_color_button_height;

int box_plot_button_enable;
int box_plot_button_x, box_plot_button_y;
int box_plot_button_width, box_plot_button_height;


PFont font;
PFont ev_font;
PFont graph_line_font;

Events evs;

//==================================setup()===============================
void setup()
{
  background(255);
  size(1024, 768);
  
  ev_button_x = 10;
  ev_button_y = 20;

  ev_button_width = originX - 40;
  ev_button_height = 20;

  begin_f = 0;
  slide = 0;

  slider_width = 70;
  slider_height = 20;

  r_slider_x = width - 100;
  l_slider_x = graphs_start_x + 2;

  r_slider_y = l_slider_y = ev_button_y;

  r_slider_flag = l_slider_flag = 0;

 

  // Slider line for Scroll bars
  start_line_x = l_slider_x + slider_width + 5;
  start_line_y = l_slider_y + slider_height/2;
  end_line_x = r_slider_x - 5;
  end_line_y = r_slider_y + slider_height/2;


  font = createFont("SansSerif", 14);

  ev_font = createFont("SansSerif", 13);

  graph_line_font = createFont("SansSerif", 8);
  
  colorMode(HSB);

  frameRate(35);

  evs = new Events(num_events);
  evs.generate_data();
  evs.generate_names_hue();

  ruler_button_x = ev_button_x;
  ruler_button_y = ev_button_y + evs.get_num_events()*ev_button_height + 20;
  ruler_button_width = ev_button_width;
  ruler_button_height = 2*ev_button_height;
  ruler_button_enable = 0;
  ruler_dot_x = originX;
  
  zoom_button_x = ruler_button_x;
  zoom_button_y = ruler_button_y + ruler_button_height + 20;
  zoom_button_width = ev_button_width/2;
  zoom_button_height = ruler_button_height;
  zoom_button_plus_enable = 0;
  zoom_button_minus_enable = 0;
  
  line_chart_button_x = zoom_button_x;
  line_chart_button_y = zoom_button_y + zoom_button_height + 80;
  line_chart_button_width = ev_button_width;
  line_chart_button_height = ruler_button_height;
  line_chart_button_enable = 0;
  
  line_chart_area_button_x = zoom_button_x;
  line_chart_area_button_y = line_chart_button_y + line_chart_button_height + 5;
  line_chart_area_button_width = ev_button_width;
  line_chart_area_button_height = ruler_button_height;
  line_chart_area_button_enable = 0;
  
  histogram_button_x = zoom_button_x;
  histogram_button_y = line_chart_area_button_y + line_chart_area_button_height + 5;
  histogram_button_width = ev_button_width;
  histogram_button_height = ruler_button_height;
  histogram_button_enable = 0;
  
  histogram_no_color_button_x = zoom_button_x;
  histogram_no_color_button_y = histogram_button_y + histogram_button_height + 5;
  histogram_no_color_button_width = ev_button_width;
  histogram_no_color_button_height = ruler_button_height;
  histogram_no_color_button_enable = 0;
  
  box_plot_button_x = zoom_button_x;
  box_plot_button_y = histogram_no_color_button_y + histogram_no_color_button_height + 15;
  box_plot_button_width = ev_button_width;
  box_plot_button_height = ruler_button_height;
  box_plot_button_enable = 0;
  /*
  evs.set_hue(255, 1);
   evs.set_hue(150, 2);
   evs.set_hue(200, 3); 
   */
}

//==================================draw()===============================
void draw()
{
  if(box_plot_button_enable == 1)
  {
    frameRate(20);
  }
  else
  {
    frameRate(35); 
  }
   
  background(255);
  
  if(box_plot_button_enable == 0)
  { 
    end_f = (width - graphs_start_x)/bar_width;
  }
  else
  {
    end_f = (width - graphs_start_x)/(bar_gap+1);
  }
  
  mouse_clicked = 0;

  drawEventButtons(evs);

  drawSliderButtons();

  checkRightMouseSlider();
  checkLeftMouseSlider();

  drawRuler();
  drawRulerButton();
  drawZoomButtons();
  drawScroller();
  drawLineChartButton();
  drawLineChartAreaButton();
  drawHistogramButton();
  drawHistogramNoColorButton();
  drawBoxPlotButton();
  
  // Blink hover bars
/*
  if (hover_bar_color >= 255)
  {
    toggle_flag = -1;
  }
  else if (hover_bar_color <= 0)
  {
    toggle_flag = 1;
  }
  
  hover_bar_color = hover_bar_color + (255/10)*toggle_flag;
  */
  
  for (int i = 1, j = 1; (i <= num_events) ; i++)
  {
    if (evs.get_flag(i) == 1)
    {
      if(line_chart_button_enable == 1)
      {
        drawLineChart(evs.get_hue(i), evs.get_data(i), evs.get_actual_data(i), j);
      }
      else if(histogram_button_enable == 1)
      {
        drawHistogram(evs.get_hue(i), evs.get_data(i), evs.get_actual_data(i), j);
      }
      else if(histogram_no_color_button_enable == 1)
      {
        drawHistogramNoColor(evs.get_hue(i), evs.get_data(i), evs.get_actual_data(i), j);
      }
      else if(line_chart_area_button_enable == 1)
      {
         drawLineChartArea(evs.get_hue(i), evs.get_data(i), evs.get_actual_data(i), j); 
      }
      else if(box_plot_button_enable == 1)
      {
        drawBoxPlots(evs.get_hue(i), evs.get_data(i), evs.get_actual_data(i), j); 
      }
      
      j++;
    }
  }
}


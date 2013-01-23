class Events
{
  float[][] t, data;
  String[] names;
  int[] flags;
  int num_events;
  float[] v_hue;
  int prev_num_histograms;
  
  Events(int num)
  {
    num_events = num;
    t = new float[num_events][data_size];
    data = new float[num_events][data_size];
    names = new String[num_events];
    flags = new int[num_events];
    v_hue = new float[num_events];

    for (int i = 0; i < num_events; i++)
    {
      names[i] = "";
      flags[i] = 0;
      for (int j = 0; j < data_size; j++)
      {
        t[i][j] = data[i][j] = 0;
      }
    }
  }

  float calculate_max_data(int n_h)
  {
    return (height - (n_h+1)*(slider_height + r_slider_y))/n_h;
  }

  void generate_data()
  {
    for (int i = 0; i < num_events; i++)
    {  
      for (int j = 0; j < data_size; j++)
      {
        //data[i][j] = random(random(calculate_max_data(num_histograms)/2), calculate_max_data(num_histograms));
        data[i][j] = random(calculate_max_data(num_histograms)/random(1,3));
        t[i][j] = data[i][j];
      }
    }
    
    prev_num_histograms = num_histograms;
  }
  
  void recalibrate_data()
  {
    for (int i = 0; i < num_events; i++)
    {  
      for (int j = 0; j < data_size; j++)
      {
        // new_data = old_data*(new_max)/old_max;
        t[i][j] = t[i][j]*(calculate_max_data(num_histograms)/calculate_max_data(prev_num_histograms));
      }
    }
    
    prev_num_histograms = num_histograms;
  }
  
  void generate_names_hue()
  {
   for (int i = 0; i < num_events; i++)
    {
      names[i] = "ev_name_" + Integer.toString(i);
      v_hue[i] = random(i*50 % 255, (i+5)*50 % 255);
    } 
  }
  
  void set_flag(int ev_no, int val)
  {
    flags[ev_no - 1] = val;
  }
  
  int get_flag(int ev_no)
  {
    return flags[ev_no - 1];
  }
  
  void set_hue(int h, int ev_no)
  {
    v_hue[ev_no - 1] = h;
  }    
  
  float get_hue(int ev_no)
  {
    return v_hue[ev_no - 1];
  }
  
  float[] get_data(int ev_no)
  {
    return t[ev_no - 1];
  }
  
  float[] get_actual_data(int ev_no)
  {
    return data[ev_no - 1];
  }
  
  int get_num_events()
  {
    return num_events;
  }
  
  String get_ev_name(int ev_no)
  {
    return names[ev_no - 1];
  }
}



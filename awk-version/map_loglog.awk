#
# map_loglog.awk, 25 Feb 14

function map_axis(min_pos, max_pos, min_val, max_val, pts)
{
#print  min_pos " "  max_pos " "  min_val " "  max_val
# May have values less than tick mark, so calculate next lower tick
lower_tick=min_val/2
log_lower_tick=log(lower_tick)
# What would be its position?
log_min_val=log(min_val)
log_max_val=log(max_val)
val_log_bounds=log_max_val-log_min_val
pos_bounds=max_pos-min_pos
lower_tick_pos= min_pos-(log_min_val-log_lower_tick)*pos_bounds/val_log_bounds

# Base everything off the position of the lower tick
for (p in pts)
   pts[p]-=lower_tick_pos

# Map into range
pos_val_map=(log_max_val-log_lower_tick)/(max_pos-lower_tick_pos)
for (p in pts)
   pts[p]*=pos_val_map

for (p in pts)
   pts[p]=exp(log_lower_tick+pts[p])

}


BEGIN {
	FS=","
	num_pts=0
	num_lines=0
	x_min_pos=""
	x_min_val=""
	y_min_pos=""
	y_min_val=""
	}

$1 == "circle" {
	num_pts++;
	x_pts[num_pts]=$2
	y_pts[num_pts]=$3
	next
	}

$1 == "line" {
	num_lines++
	if (num_lines == 1) # skip first line
	   next
# Are the ticks along the x or y axis?
	if ($2 == $4)
	   {
	   if (x_min_pos == "")
	      x_min_pos=$2
	   x_max_pos=$2
	   last_saw="x"
	   }
	else if ($3 == $5)
	   {
	   if (y_min_pos == "")
	      y_min_pos=$3
	   y_max_pos=$3
	   last_saw="y"
	   }
	
	next
	}


$1 == "text" {
	tick_str=$4
	gsub(" ", "", tick_str)
	if (substr(tick_str, 1, 1) == "(")
	   tick_str=substr(tick_str, 2)
	if (substr(tick_str, length(tick_str)) == ")")
	   tick_str=substr(tick_str, 1, length(tick_str)-1)
# print tick_str "," length(tick_str)
	# Is this a number?
	if (1+tick_str-1 != tick_str+0)
	   next
	num_lines=0
	if (last_saw == "x")
	   {
	   if (x_min_val == "")
	      x_min_val=tick_str
	   x_max_val=tick_str
	   }
	else if (last_saw == "y")
	   {
	   if (y_min_val == "")
	      y_min_val=tick_str
	   y_max_val=tick_str
	   }
	next
	}

END {
	map_axis(x_min_pos, x_max_pos, x_min_val, x_max_val, x_pts)
	map_axis(y_min_pos, y_max_pos, y_min_val, y_max_val, y_pts)

	# Print out in the order encountered
	for (p=1; p <= num_pts; p++)
	   print x_pts[p] "," y_pts[p]
	}


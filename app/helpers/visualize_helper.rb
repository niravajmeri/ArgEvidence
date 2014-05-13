require "rubygems"  # allows for the loading of gems
require "graphviz"  # this loads the ruby-graphviz gem

module VisualizeHelper

def generate_graph
	# initialize new Graphviz graph
	g = GraphViz::new( "structs", "type" => "graph" )
	g[:rankdir] = "LR"


	# set global node options
	g.node[:color]    = "#ddaa66"
	g.node[:style]    = "filled"
	g.node[:shape]    = "box"
	g.node[:penwidth] = "1"
	g.node[:fontname] = "Trebuchet MS"
	g.node[:fontsize] = "8"
	g.node[:fillcolor]= "#ffeecc"
	g.node[:fontcolor]= "#775500"
	g.node[:margin]   = "0.0"

	# set global edge options
	g.edge[:color]    = "#999999"
	g.edge[:weight]   = "1"
	g.edge[:fontsize] = "6"
	g.edge[:fontcolor]= "#444444"
	g.edge[:fontname] = "Verdana"
	g.edge[:dir]      = "forward"
	g.edge[:arrowsize]= "0.5"

	arguments = Argument.all
	evidences = Evidence.all
	argument_evidences = ArgumentEvidence.all

	arguments.each do|argument|
		g.add_nodes(argument.title)
		#g.add_node(argument) = argument.title
	end

	evidences.each do|evidence|
		#g.add_node(evidence).label = evidence.title
		g.add_nodes(evidence.title,  :shape => "ellipse" )
	end
	
	argument_evidences.each do|argument_evidence|
		g.add_edges(argument_evidence.evidence.title, argument_evidence.argument.title)
	end
	

	#g.output( "output" => "png", :file => "graph.png" )
	
	#main        = g.add_nodes( "main" )
	#parse       = g.add_nodes( "parse" )
	#execute     = g.add_nodes( "execute" )
	#init        = g.add_nodes( "init" )
	#cleanup     = g.add_nodes( "cleanup" )
	#make_string = g.add_nodes( "make_string" )
	#printf      = g.add_nodes( "printf" )
	#compare     = g.add_nodes( "compare" )

	#g.add_edges( main, parse )
	#g.add_edges( parse, execute )
	#g.add_edges( main, init )
	#g.add_edges( main, cleanup )
	#g.add_edges( execute, make_string )
	#g.add_edges( execute, printf )
	#g.add_edges( init, make_string )
	#g.add_edges( main, printf )
	#g.add_edges( execute, compare )

	
	g.output( :png => "app/assets/images/arg_evidence.png" )
	
	end


end

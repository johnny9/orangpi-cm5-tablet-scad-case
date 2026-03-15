// Orange Pi tablet base board enclosure - rev 3
// Board size target: 90 mm x 66 mm
// Changes in this revision:
//   - Corner-only PCB standoffs
//   - Standoffs start near the base floor instead of lifting the PCB very high
//   - PCB is screwed to the bottom shell
//   - Top cover is screwless and slides into rails in the bottom shell
//
// Export either assembled view, base only, or lid only.

show_mode = "lid";   // "assembly", "base", "lid"
explode = 10;

// -----------------------------
// User-tunable dimensions
// -----------------------------
board_x = 90;
board_y = 66;
board_thickness = 1.6;

// Fit / clearance
board_clearance_xy = 1.2;      // total extra space around PCB footprint; keeps at least 90 x 66 mm from standoff edge to opposite wall
board_edge_capture = 0.0;      // keep disabled; screw-mounted PCB does not need tiny anti-rattle tabs

// Shell
wall = 3.0;
corner_r = 6.0;
bottom_thickness = 2.6;
lid_thickness = 2.2;

// PCB mounting height
// Keep 8 mm from the inner floor to the PCB underside for the M.2 drive.
underside_clearance = 8.0;     // distance from inner floor to underside of PCB
standoff_extra_h = 0.15;       // tiny preload so board sits firmly

// Space above PCB for components / lid
topside_clearance = 15.5;

// Sliding lid system
rail_height = 2.2;
rail_width = 1.8;
rail_gap = 0.35;
lid_insert_depth = 7.0;
lid_stop_depth = 2.0;
lid_has_detent = true;
lid_detent_d = 1.2;
lid_detent_protrusion = 0.38;
lid_detent_pocket_depth = 0.22;
lid_detent_pocket_len = 1.6;
lid_detent_y = wall + lid_stop_depth + 3.0;

// Windows / access openings
long_window_margin = 7;
short_window_margin = 7;
window_floor_margin = 3.0;
long_window_roof_margin = 3.0;   // printable top band along the long walls
short_window_roof_margin = 3.0;  // keep more material on the rail side walls
min_long_window_clearance_above_board = 16.0;

// PCB mounting
// Corner-based pattern. Baseline hole centers are 2.5 mm inboard from the PCB edges.
pcb_corner_inset_x = 2.5;
pcb_corner_inset_y = 2.5;
// In the top-view landscape orientation, the top-left hole is the left/high-Y corner.
pcb_tl_extra_inset_x = 0.0;
pcb_tl_extra_inset_y = 0.0;
pcb_tr_extra_inset_x = 0.0;
pcb_tr_extra_inset_y = 0.0;
pcb_bl_extra_inset_x = 0.0;
pcb_bl_extra_inset_y = 1.5;
pcb_br_extra_inset_x = 0.0;
pcb_br_extra_inset_y = 0.0;
pcb_hole_d = 2.5;              // measured PCB mounting hole diameter
pcb_screw_pilot_d = 1.9;       // M2 pilot for a screw threading into printed plastic
pcb_screw_bottom_margin = 1.2; // keep the outer floor closed under the blind standoff hole
standoff_d = 8.0;

// Vent pattern
lid_has_vents = false;
vent_slot_x = 4;
vent_slot_y = 18;
vent_spacing_x = 8;
vent_spacing_y = 11;
vent_cols = 7;
vent_rows = 3;

// -----------------------------
// Derived dimensions
// -----------------------------
inner_x = board_x + board_clearance_xy;
inner_y = board_y + board_clearance_xy;
outer_x = inner_x + 2*wall;
outer_y = inner_y + 2*wall;
pcb_tl_inset_x = pcb_corner_inset_x + pcb_tl_extra_inset_x;
pcb_tl_inset_y = pcb_corner_inset_y + pcb_tl_extra_inset_y;
pcb_tr_inset_x = pcb_corner_inset_x + pcb_tr_extra_inset_x;
pcb_tr_inset_y = pcb_corner_inset_y + pcb_tr_extra_inset_y;
pcb_bl_inset_x = pcb_corner_inset_x + pcb_bl_extra_inset_x;
pcb_bl_inset_y = pcb_corner_inset_y + pcb_bl_extra_inset_y;
pcb_br_inset_x = pcb_corner_inset_x + pcb_br_extra_inset_x;
pcb_br_inset_y = pcb_corner_inset_y + pcb_br_extra_inset_y;
max_corner_inset_x = max(max(pcb_tl_inset_x, pcb_tr_inset_x), max(pcb_bl_inset_x, pcb_br_inset_x));
max_corner_inset_y = max(max(pcb_tl_inset_y, pcb_tr_inset_y), max(pcb_bl_inset_y, pcb_br_inset_y));
left_mount_inset_x = max(pcb_tl_inset_x, pcb_bl_inset_x);
right_mount_inset_x = max(pcb_tr_inset_x, pcb_br_inset_x);
top_mount_inset_y = max(pcb_tl_inset_y, pcb_tr_inset_y);
bottom_mount_inset_y = max(pcb_bl_inset_y, pcb_br_inset_y);
board_room_from_standoff_x = board_x + board_clearance_xy/2 - max_corner_inset_x + standoff_d/2;
board_room_from_standoff_y = board_y + board_clearance_xy/2 - max_corner_inset_y + standoff_d/2;

board_x0 = (outer_x - board_x)/2;
board_y0 = (outer_y - board_y)/2;
board_z = bottom_thickness + underside_clearance;
board_top_z = board_z + board_thickness;
base_h = board_z + board_thickness + topside_clearance + rail_height + 1.6;
lid_h = lid_thickness + lid_insert_depth;
join_eps = 0.05;
top_drop_in_x = inner_x;
top_drop_in_y = inner_y;
long_window_clearance_above_board = base_h - long_window_roof_margin - board_top_z;
window_standoff_keepout = 0.8;
long_window_margin_eff = max(long_window_margin, board_x0 + max(left_mount_inset_x, right_mount_inset_x) + standoff_d/2 + window_standoff_keepout);
short_window_margin_eff = max(short_window_margin, board_y0 + max(top_mount_inset_y, bottom_mount_inset_y) + standoff_d/2 + window_standoff_keepout);

$fn = 64;

assert(standoff_d > pcb_screw_pilot_d, "standoff_d must be larger than pcb_screw_pilot_d");
assert(lid_insert_depth > rail_height, "lid_insert_depth must exceed rail_height to capture the lid rails");
assert(!lid_has_detent || lid_detent_protrusion > rail_gap, "lid_detent_protrusion must exceed rail_gap to create a detent");
assert(!lid_has_detent || lid_detent_pocket_depth > lid_detent_protrusion - rail_gap, "lid_detent_pocket_depth must be deeper than the detent interference");
assert(!lid_has_detent || (lid_detent_y > wall && lid_detent_y < wall + inner_y), "lid_detent_y must fall on the runner span");
assert(board_room_from_standoff_x >= board_x, "Increase board_clearance_xy to keep 90 mm from standoff edge to opposite wall");
assert(board_room_from_standoff_y >= board_y, "Increase board_clearance_xy to keep 66 mm from standoff edge to opposite wall");
assert(top_drop_in_x >= board_x, "Top opening must stay at least 90 mm wide for clean drop-in");
assert(top_drop_in_y >= board_y, "Top opening must stay at least 66 mm deep for clean drop-in");
assert(long_window_clearance_above_board >= min_long_window_clearance_above_board, "Increase case height to keep at least 16 mm of long-side port access above the PCB");
assert(2*long_window_margin_eff < outer_x, "Long-side windows leave no remaining opening");
assert(2*short_window_margin_eff < outer_y, "Short-side windows leave no remaining opening");
assert(board_z + standoff_extra_h > pcb_screw_bottom_margin, "Blind screw hole bottom margin is taller than the standoff");

module rounded_box(size=[10,10,10], r=2) {
    sx = size[0]; sy = size[1]; sz = size[2];
    hull() {
        for (x = [r, sx-r])
            for (y = [r, sy-r])
                translate([x,y,0]) cylinder(h=sz, r=r);
    }
}

module pcb_hole_positions() {
    translate([board_x0 + pcb_tl_inset_x, board_y0 + pcb_tl_inset_y, 0]) children();
    translate([board_x0 + board_x - pcb_tr_inset_x, board_y0 + pcb_tr_inset_y, 0]) children();
    translate([board_x0 + pcb_bl_inset_x, board_y0 + board_y - pcb_bl_inset_y, 0]) children();
    translate([board_x0 + board_x - pcb_br_inset_x, board_y0 + board_y - pcb_br_inset_y, 0]) children();
}

module base_side_rails() {
    // Keep the lid rails inside the wall thickness so the top opening stays clear.
    translate([wall - rail_width - join_eps, wall, base_h - rail_height])
        cube([rail_width + join_eps, inner_y, rail_height]);
    translate([outer_x - wall, wall, base_h - rail_height])
        cube([rail_width + join_eps, inner_y, rail_height]);
    if (lid_has_detent)
        // Single-side detent reduces the chance of both rails binding at once.
        translate([wall + lid_detent_protrusion - lid_detent_d/2, lid_detent_y, base_h - rail_height - join_eps])
            cylinder(h=rail_height + 2*join_eps, d=lid_detent_d);
}

module board_edge_nibs() {
    nib_w = 6;
    nib_d = board_edge_capture;
    nib_h = 1.2;

    if (nib_d > 0)
    for (xx = [board_x0 + 14, board_x0 + board_x - 14 - nib_w]) {
        translate([xx, board_y0 - nib_d - join_eps, board_z + board_thickness - nib_h])
            cube([nib_w, nib_d + join_eps, nib_h]);
        translate([xx, board_y0 + board_y - join_eps, board_z + board_thickness - nib_h])
            cube([nib_w, nib_d + join_eps, nib_h]);
    }
}

module standoffs() {
    standoff_h = board_z + standoff_extra_h;
    pcb_hole_positions() cylinder(h=standoff_h, d=standoff_d);
}

module standoff_holes() {
    standoff_h = board_z + standoff_extra_h;
    pilot_h = standoff_h - pcb_screw_bottom_margin;
    pcb_hole_positions()
        translate([0,0,standoff_h - pilot_h])
            cylinder(h=pilot_h + 0.1, d=pcb_screw_pilot_d);
}

module base_shell() {
    difference() {
        union() {
            difference() {
                rounded_box([outer_x, outer_y, base_h], corner_r);

                // Open-top shell with a preserved floor.
                translate([wall, wall, bottom_thickness])
                    cube([inner_x, inner_y, base_h - bottom_thickness + 0.2]);

                // long-side windows
                long_len = outer_x - 2*long_window_margin_eff;
                long_h = base_h - window_floor_margin - long_window_roof_margin;
                translate([long_window_margin_eff, -0.1, window_floor_margin])
                    cube([long_len, wall+0.2, long_h]);
                translate([long_window_margin_eff, outer_y-wall-0.1, window_floor_margin])
                    cube([long_len, wall+0.2, long_h]);

                // short-side windows
                short_len = outer_y - 2*short_window_margin_eff;
                short_h = base_h - window_floor_margin - short_window_roof_margin - rail_height;
                translate([-0.1, short_window_margin_eff, window_floor_margin])
                    cube([wall+0.2, short_len, short_h]);
                translate([outer_x-wall-0.1, short_window_margin_eff, window_floor_margin])
                    cube([wall+0.2, short_len, short_h]);
            }

            standoffs();
            base_side_rails();
            board_edge_nibs();
        }

        standoff_holes();
    }
}

module lid_runner(x0, has_detent=false) {
    runner_len = inner_y;
    difference() {
        translate([x0, wall - join_eps, lid_thickness - join_eps])
            cube([rail_width, runner_len + join_eps, lid_insert_depth + join_eps]);
        if (has_detent && lid_has_detent)
            translate([x0 - join_eps, lid_detent_y - lid_detent_pocket_len/2, lid_thickness - join_eps])
                cube([lid_detent_pocket_depth + join_eps, lid_detent_pocket_len, rail_height + join_eps]);
    }
}

module lid_runners() {
    lid_runner(wall + rail_gap, true);
    lid_runner(outer_x - wall - rail_width - rail_gap);
}

module lid_shell() {
    difference() {
        union() {
            rounded_box([outer_x, outer_y, lid_thickness], corner_r);
            lid_runners();
        }

        if (lid_has_vents)
            for (ix = [0:vent_cols-1])
                for (iy = [0:vent_rows-1]) {
                    vx = outer_x/2 - ((vent_cols-1)*vent_spacing_x)/2 + ix*vent_spacing_x;
                    vy = outer_y/2 - ((vent_rows-1)*vent_spacing_y)/2 + iy*vent_spacing_y;
                    translate([vx - vent_slot_x/2, vy - vent_slot_y/2, -0.1])
                        cube([vent_slot_x, vent_slot_y, lid_thickness + 0.2]);
                }
    }
}

module pcb_mock() {
    color([0.0,0.45,0.1,1])
    translate([board_x0, board_y0, board_z])
        cube([board_x, board_y, board_thickness]);
    color([0.9,0.8,0.2,1])
    pcb_hole_positions()
        translate([0,0,board_z]) cylinder(h=board_thickness, d=pcb_hole_d);
}

module assembled_case() {
    color([0.20,0.20,0.22,1.0]) base_shell();
    pcb_mock();
    translate([0, outer_y - explode, base_h + lid_thickness])
        rotate([180,0,0])
            color([0.25,0.25,0.28,1.0]) lid_shell();
}

if (show_mode == "assembly") {
    assembled_case();
} else if (show_mode == "base") {
    base_shell();
} else if (show_mode == "lid") {
    lid_shell();
}

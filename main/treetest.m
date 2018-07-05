main

sus_groups = a.susGroups
%This loop is the loop that forms the root of the tree
for sus_group_base_idx = 1:1%length(sus_groups)
    stas_orth_set = sus_groups(sus_group_base_idx).stasSet;
    stas_orth_tree = sus_groups(sus_group_base_idx).staTree;
    current_sus_root_id = stas_orth_tree.get(1).id;
    current_parent_idx = 1;%Root of the tree
    %This loop examines the STAs that are in the orthogonal set of the root sta
    sta_cmp_id = []
    for sta_cmp_id_idx = 1:length(stas_orth_set)
        current_sta_cmp = stas_orth_set(sta_cmp_idx);
        if length(sta_cmp_id) == 0
            sta_cmp_id = current_sta_cmp.id;
        else
            sta_cmp_id = [sta_cmp_id; current_sta_cmp.id];
        end
    end
    for sta_cmp_id_idx = 1:length(stas_orth_set)
        current_sta_cmp = stas_orth_set(sta_cmp_idx);
        sta_cmp_id = current_sta_cmp.id;
        %This loop examines the STAs that are in the orthogonal set of the root sta
        for sus_mut_orth_ck_idx = sus_group_base_idx+1:length(sus_groups)
            %Check to see if the root of the set we are checking is orth to the base root
            %if it is, then we the root to the list of stas to be added to the current branch of
            %the base tree, and look for intersections between the base orth set, and this orth set
            if sus_groups(sus_mut_orth_ck_idx).staTree(1).id == sta_cmp_id
                %Add the STAs that are orth to the node that is orth to the root to check
                %for mutual orth.
                current_stas_mut_orth_ck = sus_groups(sus_mut_orth_ck_idx).stasSet;
                %List of STAs to add to the current branch of the base root's tree
                stas_to_add_to_branch = sus_groups(sus_mut_orth_ck_idx).staTree(1);
                for sta_mut_orth_ck_idx = 1:length(current_stas_mut_orth_ck)
                    sta_mut_orth_ck = current_stas_mut_orth_ck(sta_mut_orth_ck_idx);

                    %Remove the current base from the sus group we are checking for mutual
                    %orthogonality to avoid duplication in the tree
                    if current_sus_root_id == sta_mut_orth_ck.id
                        sus_groups(sus_mut_orth_ck_idx, sta_mut_orth_ck_idx) = [];
                    end

                    mut_sta_idx = find(sta_cmp_id,sta_mut_orth_ck.id)
                    if length(mut_sta_idx)~= 0
                        current_parent_idx = current_parent_idx + 1;
                        child_sta_id  = sta_cmp_id(mut_sta_idx);
                        sta_cmp_id(mut_sta_idx) = [];
                        for sus_mut_orth_ck_idx = sus_group_base_idx+2:length(sus_groups)

                        end
                    end
                end
            end
        end
    end
end

main

sus_groups = a.susGroups;
%This loop is the loop that forms the root of the tree
for sus_group_base_idx = 1:1%length(sus_groups)
    stas_orth_set = sus_groups(sus_group_base_idx).stasSet;
    %stas_orth_tree = sus_groups(sus_group_base_idx).staTree;
    %current_sus_root_id = stas_orth_tree.get(1).id;
    %current_parent_idx = 1;%Root of the tree
    %This loop examines the STAs that are in the orthogonal set of the root sta
    stas_cmp_id = [];
    sta_mut_orth_ck_ids_vec = [];
    for sta_cmp_id_idx = 1:length(stas_orth_set)
        current_sta_cmp = stas_orth_set(sta_cmp_id_idx);
        if length(stas_cmp_id) == 0
            stas_cmp_id = current_sta_cmp.id;
        else
            stas_cmp_id = [stas_cmp_id current_sta_cmp.id];
        end
    end
    %stas_cmp_id_bk = stas_cmp_id;
    %stas_cmp_id = reshape(stas_cmp_id, length(stas_orth_set), 1);
    for sta_cmp_idx = 1:length(stas_orth_set)
        current_sta_cmp = stas_orth_set(sta_cmp_idx);
        sta_cmp_id = current_sta_cmp.id;
        %This loop examines the STAs that are in the orthogonal set of the root sta
        for sus_mut_orth_ck_idx = 1:length(sus_groups)
            %Check to see if the root of the set we are checking is orth to the base root
            %if it is, then we the root to the list of stas to be added to the current branch of
            %the base tree, and look for intersections between the base orth set, and this orth set
            if sus_groups(sus_mut_orth_ck_idx).staTree.get(1).id == sta_cmp_id
                %sus_mut_orth_ck_idx
                %sta_cmp_id 
                %Add the STAs that are orth to the node that is orth to the root to check
                %for mutual orth.
                current_stas_mut_orth_ck = sus_groups(sus_mut_orth_ck_idx).stasSet;
                sta_mut_orth_ck_ids = [];
                for sta_mut_orth_ck_idx = 1:length(current_stas_mut_orth_ck)
                    sta_mut_orth_ck = current_stas_mut_orth_ck(sta_mut_orth_ck_idx);
                    if length(sta_mut_orth_ck_ids) == 0
                        sta_mut_orth_ck_ids  = sta_mut_orth_ck.id;
                    else
                        sta_mut_orth_ck_ids  = [sta_mut_orth_ck_ids sta_mut_orth_ck.id];
                    end
                end
                %sta_mut_orth_ck_ids = reshape(sta_mut_orth_ck_ids,length(current_stas_mut_orth_ck),1);
                if length(sta_mut_orth_ck_ids_vec) == 0
                    sta_mut_orth_ck_ids_vec  = Vec(sta_mut_orth_ck_ids);
                else
                    sta_mut_orth_ck_ids_vec  = [sta_mut_orth_ck_ids_vec Vec(sta_mut_orth_ck_ids)];
                end
            end
        end
    end
    intsct = recurIntsct(sta_mut_orth_ck_ids_vec, length(sta_mut_orth_ck_ids_vec)-5);
end
%    for sta_cmp_id_idx = 1:length(stas_orth_set)
%        current_sta_cmp = stas_orth_set(sta_cmp_idx);
%        sta_cmp_id = current_sta_cmp.id;
%        %This loop examines the STAs that are in the orthogonal set of the root sta
%        for sus_mut_orth_ck_idx = sus_group_base_idx+1:length(sus_groups)
%            %Check to see if the root of the set we are checking is orth to the base root
%            %if it is, then we the root to the list of stas to be added to the current branch of
%            %the base tree, and look for intersections between the base orth set, and this orth set
%            if sus_groups(sus_mut_orth_ck_idx).staTree(1).id == sta_cmp_id
%                %Add the STAs that are orth to the node that is orth to the root to check
%                %for mutual orth.
%                current_stas_mut_orth_ck = sus_groups(sus_mut_orth_ck_idx).stasSet;
%                %List of STAs to add to the current branch of the base root's tree
%                stas_to_add_to_branch = sus_groups(sus_mut_orth_ck_idx).staTree(1);
%                for sta_mut_orth_ck_idx = 1:length(current_stas_mut_orth_ck)
%                    sta_mut_orth_ck = current_stas_mut_orth_ck(sta_mut_orth_ck_idx);
%
%                    %Remove the current base from the sus group we are checking for mutual
%                    %orthogonality to avoid duplication in the tree
%                    if current_sus_root_id == sta_mut_orth_ck.id
%                        sus_groups(sus_mut_orth_ck_idx, sta_mut_orth_ck_idx) = [];
%                    end
%
%                    mut_sta_idx = find(sta_cmp_id,sta_mut_orth_ck.id)
%                    if length(mut_sta_idx)~= 0
%                        current_parent_idx = current_parent_idx + 1;
%                        child_sta_id  = sta_cmp_id(mut_sta_idx);
%                        sta_cmp_id(mut_sta_idx) = [];
%                        for sus_mut_orth_ck_idx = sus_group_base_idx+2:length(sus_groups)
%
%                        end
%                    end
%                end
%            end
%        end

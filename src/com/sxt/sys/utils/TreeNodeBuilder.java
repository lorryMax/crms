package com.sxt.sys.utils;

import java.util.ArrayList;
import java.util.List;

/**
 * 实现easyui标准的JSON树
 */
public class TreeNodeBuilder {

    public static List<TreeNode> builder(List<TreeNode> nodes, Integer topId) {
        List<TreeNode>  treeNodes =new ArrayList<>();

        for (TreeNode n1 : nodes) {
            if(n1.getPid()==topId){//找到顶层节点
                treeNodes.add(n1);
                for (TreeNode n2 : nodes) {
                    if(n2.getPid()==n1.getId()){
                        //如果外层id等于里层pid ,说明n2是n1的子节点
                        //把n2放到n1的children里
                        n1.getChildren().add(n2);
                    }
                }
            }
        }
        return  treeNodes;
    }
}

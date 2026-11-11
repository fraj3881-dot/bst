package bstdemo;

public class BST {
    Node root;

    public BST() {
        root=null;
    }
    void insertNode(int d)
    {
        root=insertHelper(root, d);
    }
    private  Node insertHelper(Node root, int d)
    {
        if(root==null) return new Node(d);
        if(d<root.data) root.left=insertHelper(root.left, d);
        else if(d>root.data) root.right=insertHelper(root.right, d);
        return root;
    }
    //+++++++++++++++++++++++++++++++++++++++++++++++++++++++
    int findMin(Node root)
    {
        Node n;
        for(n=root;n.left!=null ;n=n.left) ;

        return n.data;
    }
    //+++++++++++++++++++++++++++++++++++++++++++++++++++++++
    int findMax(Node root)
    {
        Node n;
        for(n=root;n.right!=null ;n=n.right) ;

        return n.data;
    }
    //+++++++++++++++++++++++++++++++++++++++++++++++++++++++
    boolean search(int d)
    {
        return searchHelper(root, d);
    }
    private boolean searchHelper(Node root, int d)
    {
        if(root==null) return false;
        if(d<root.data) return searchHelper(root.left, d);
        else if(d>root.data) return searchHelper(root.right, d);
        return true;
    }
    //++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    public void deleteNode(int d)
    {
        root=deleteNodeHelper(root, d);
    }
    private Node deleteNodeHelper(Node root, int d)
    {
        if(root==null) return root;
        if(d<root.data)
                root.left=deleteNodeHelper(root.left, d);
        else if (d>root.data) root.right=deleteNodeHelper(root.right,d);
        else
        {
            if(root.left==null&&root.right==null)
            {
                return null;
            }
            else if(root.left==null)
            {
                return root.right;
            }
            else if(root.right==null)
            {
                return root.left;
            }
            else
            {
                int k=findMin(root.right);
                root.data=k;

                root.right=deleteNodeHelper(root.right  ,k);
            }
        }
        return root;
    }

    //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    void preOrder()
    {
        preOrderHelper(root);
    }
    private void preOrderHelper(Node root)
    {
        if(root==null) return ;
        System.out.println(root.data);
        preOrderHelper(root.left);
        preOrderHelper(root.right);
    }
    //++++++++++++++++++++++++++
    void postOrder()
    {
        postOrderHelper(root);
    }
    private void postOrderHelper(Node root)
    {
        if(root==null) return ;

        postOrderHelper(root.left);
        postOrderHelper(root.right);
        System.out.println(root.data);
    }
    ////////////////////////////////
    void inOrder()
    {
        inOrderHelper(root);
    }
    private void inOrderHelper(Node root)
    {
        if(root==null) return ;

        inOrderHelper(root.left);
        System.out.println(root.data);
        inOrderHelper(root.right);
    }
}

package bst;

public class BSTdemo {
    public static void main(String[] args) {
        BST tree = new BST();
        tree.insertNode(50);
        tree.insertNode(30);
        tree.insertNode(70);
        tree.insertNode(20);
        tree.insertNode(80);

        System.out.println(tree.search(30));          // true
        System.out.println(tree.search(100));         // false
        System.out.println(tree.findMax(tree.root));  // 80
    }
}

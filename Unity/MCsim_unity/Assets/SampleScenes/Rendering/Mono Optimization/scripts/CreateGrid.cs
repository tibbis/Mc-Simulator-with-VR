using UnityEngine;
using System.Collections;

public class CreateGrid : MonoBehaviour {

    public GameObject obj;
    public Vector3 minPos;
    public Vector3 maxPos;
    public int[] gridSize = new int[3];

	// Use this for initialization
	void Start () {

        Vector3 boxSize = maxPos - minPos;
        Vector3 spacing = new Vector3(boxSize.x / gridSize[0], boxSize.y / gridSize[1], boxSize.z / gridSize[2]);

        for (int x = 0; x < gridSize[0]; x++)
            for (int y = 0; y < gridSize[1]; y++)
                for (int z = 0; z < gridSize[2]; z++)
                {
                    Vector3 pos = minPos + new Vector3(spacing.x * x, spacing.y * y, spacing.z * z);
                    Instantiate(obj, pos, Quaternion.identity);
                }


    }

    // Update is called once per frame
    void Update () {
	
	}
}

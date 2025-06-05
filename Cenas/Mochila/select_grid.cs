using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class Select_Grid : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
    public GameObject[] obj;
    public Sprite[] sprite;
    
    
    public void OnPointerEnter(PointerEventData pointerEventData)
    {
 

        //Output to console the GameObject's name and the following message
        Debug.Log("Cursor Entering " + name + " GameObject");

            if (name == obj[0].name)
            {
                obj[0].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[1].name)
            {
                obj[1].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[2].name)
            {
                obj[2].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[3].name)
            {
                obj[3].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[4].name)
            {
                obj[4].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[5].name)
            {
                obj[5].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[6].name)
            {
                obj[6].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[7].name)
            {
                obj[7].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[8].name)
            {
                obj[8].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[9].name)
            {
                obj[9].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[10].name)
            {
                obj[10].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[11].name)
            {
                obj[11].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[12].name)
            {
                obj[12].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[13].name)
            {
                obj[13].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[14].name)
            {
                obj[14].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[15].name)
            {
                obj[15].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[16].name)
            {
                obj[16].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[17].name)
            {
                obj[17].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[18].name)
            {
                obj[18].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[19].name)
            {
                obj[19].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[20].name)
            {
                obj[20].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[21].name)
            {
                obj[21].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[22].name)
            {
                obj[22].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[23].name)
            {
                obj[23].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[24].name)
            {
                obj[24].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[25].name)
            {
                obj[25].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[26].name)
            {
                obj[26].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[27].name)
            {
                obj[27].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[28].name)
            {
                obj[28].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
            else if(name == obj[29].name)
            {
                obj[29].gameObject.GetComponent<Image>().sprite = sprite[1];
            }
  
    
        
    }

    public void OnPointerExit(PointerEventData pointerEventData)
    {
        if (name == obj[0].name)
        {
            obj[0].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[1].name)
        {
            obj[1].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[2].name)
        {
            obj[2].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[3].name)
        {
            obj[3].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[4].name)
        {
            obj[4].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[5].name)
        {
            obj[5].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[6].name)
        {
            obj[6].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[7].name)
        {
            obj[7].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[8].name)
        {
            obj[8].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[9].name)
        {
            obj[9].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[10].name)
        {
            obj[10].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[11].name)
        {
            obj[11].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[12].name)
        {
            obj[12].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[13].name)
        {
            obj[13].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[14].name)
        {
            obj[14].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[15].name)
        {
            obj[14].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[15].name)
        {
            obj[15].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[16].name)
        {
            obj[16].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[17].name)
        {
            obj[17].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[18].name)
        {
            obj[18].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[19].name)
        {
            obj[19].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[20].name)
        {
            obj[20].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[21].name)
        {
            obj[21].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[22].name)
        {
            obj[22].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[23].name)
        {
            obj[23].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[24].name)
        {
            obj[24].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[25].name)
        {
            obj[25].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[26].name)
        {
            obj[26].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[27].name)
        {
            obj[27].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[28].name)
        {
            obj[28].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        if (name == obj[29].name)
        {
            obj[29].gameObject.GetComponent<Image>().sprite = sprite[0];
        }
        
    }

}

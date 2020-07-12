using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering.PostProcessing;

public class PostProcessing_Control : MonoBehaviour
{
    public PostProcessVolume vol;


    private float sin;
    private Grayscaler _grayscale;
    // Start is called before the first frame update
    void Start()
    {
        vol.profile.TryGetSettings(out _grayscale);
        
        _grayscale.blend.value = 0;
    }

    // Update is called once per frame
    void Update()
    {
        sin += Time.deltaTime * 0.05f;
        //Mathf.Sin(sin);
        _grayscale.blend.value = sin;
        Debug.Log(_grayscale.blend.value);

    } 

    IEnumerator wait()
    {
        yield return new WaitForSeconds(2f);
    }
}
